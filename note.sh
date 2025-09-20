#!/usr/bin/env bash
# Pure Bash Markdown TUI
# Usage: ./md_tui.sh <file.md>

set -euo pipefail

FILE="$1"
if [[ -z "$FILE" ]]; then
    echo "Usage: $0 <markdown_file>"
    exit 1
fi

# Expand to full path
FILE="$(realpath "$FILE")"

# Create file if it doesn't exist
if [[ ! -f "$FILE" ]]; then
    touch "$FILE"
    echo "Created new file: $FILE"
fi

# Terminal setup
setup_terminal() {
    # Save terminal state
    exec 3>&1
    exec 4>&2

    # Set raw mode
    stty -echo -icanon min 1 time 0

    # Hide cursor and clear screen
    printf '\033[?25l'  # Hide cursor
    printf '\033[2J'    # Clear screen
    printf '\033[H'     # Move to top-left

    # Set up trap to restore terminal on exit
    trap cleanup EXIT INT TERM
}

cleanup() {
    # Restore terminal
    printf '\033[?25h'  # Show cursor
    printf '\033[2J'    # Clear screen
    printf '\033[H'     # Move to top-left
    stty echo icanon
    exec 1>&3 3>&-
    exec 2>&4 4>&-
}

# Get terminal size
get_terminal_size() {
    local size
    size=$(stty size)
    ROWS=${size% *}
    COLS=${size#* }
    HALF_COLS=$((COLS / 2))
}

# Draw functions
draw_status_bar() {
    printf '\033[1;1H\033[7m'  # Move to top, reverse colors
    local status="File: $(basename "$FILE") | F2: Save | F10: Quit | Tab: Switch Pane"
    printf "%-${COLS}s" "$status"
    printf '\033[0m'  # Reset colors
}

draw_separator() {
    local row
    for ((row=2; row<=ROWS; row++)); do
        printf '\033[%d;%dH|' "$row" "$HALF_COLS"
    done
}

draw_editor_pane() {
    local start_line=${1:-1}
    local row=2
    local line_num=$start_line

    # Clear editor pane
    for ((row=2; row<=ROWS; row++)); do
        printf '\033[%d;1H\033[K' "$row"
    done

    # Read file and display
    row=2
    while IFS= read -r line && [[ $row -le $ROWS ]]; do
        if [[ $line_num -ge $start_line ]]; then
            # Truncate line if too long
            if [[ ${#line} -gt $((HALF_COLS - 2)) ]]; then
                line="${line:0:$((HALF_COLS - 5))}..."
            fi
            printf '\033[%d;1H%s' "$row" "$line"
            ((row++))
        fi
        ((line_num++))
    done < "$FILE"
}

draw_preview_pane() {
    local start_col=$((HALF_COLS + 2))
    local width=$((COLS - HALF_COLS - 2))
    local row=2

    # Clear preview pane
    for ((row=2; row<=ROWS; row++)); do
        printf '\033[%d;%dH\033[%dX' "$row" "$start_col" "$width"
    done

    # Generate preview
    local temp_preview="/tmp/md_preview_$$"

    if command -v glow >/dev/null 2>&1; then
        # Use glow if available
        glow -s auto -w $((width - 2)) "$FILE" > "$temp_preview" 2>/dev/null || {
            # Fallback to basic preview
            generate_basic_preview > "$temp_preview"
        }
    else
        # Basic markdown preview
        generate_basic_preview > "$temp_preview"
    fi

    # Display preview
    row=2
    while IFS= read -r line && [[ $row -le $ROWS ]]; do
        # Truncate line if needed
        if [[ ${#line} -gt $width ]]; then
            line="${line:0:$((width - 1))}"
        fi
        printf '\033[%d;%dH%s' "$row" "$start_col" "$line"
        ((row++))
    done < "$temp_preview"

    rm -f "$temp_preview"
}

generate_basic_preview() {
    while IFS= read -r line; do
        if [[ "$line" =~ ^#[[:space:]]+ ]]; then
            # H1
            echo "══════════════════════"
            echo "  ${line#\# }"
            echo "══════════════════════"
        elif [[ "$line" =~ ^##[[:space:]]+ ]]; then
            # H2
            echo "──────────────────────"
            echo "  ${line#\#\# }"
            echo "──────────────────────"
        elif [[ "$line" =~ ^###[[:space:]]+ ]]; then
            # H3
            echo "••• ${line#\#\#\# } •••"
        elif [[ "$line" =~ ^-[[:space:]]+ ]] || [[ "$line" =~ ^\*[[:space:]]+ ]]; then
            # Bullet points
            echo "  • ${line#[*-] }"
        elif [[ "$line" =~ ^\$\$.*\$\$$ ]]; then
            # Math block
            local math="${line#\$\$}"
            math="${math%\$\$}"
            echo "[MATH BLOCK] $math"
        elif [[ "$line" =~ \$[^$]+\$ ]]; then
            # Inline math - simple replacement
            local processed_line="$line"
            processed_line="${processed_line//\$([^$]+)\$/[\1]}"
            echo "$processed_line"
        else
            echo "$line"
        fi
    done < "$FILE"
}

# Editor functions
open_editor() {
    # Restore terminal temporarily
    printf '\033[?25h'  # Show cursor
    stty echo icanon

    # Open editor
    ${EDITOR:-vim} "$FILE"

    # Return to raw mode
    stty -echo -icanon min 1 time 0
    printf '\033[?25l'  # Hide cursor

    # Full redraw needed
    draw_screen
}

draw_screen() {
    printf '\033[2J\033[H'  # Clear screen and move to top
    get_terminal_size
    draw_status_bar
    draw_separator
    draw_editor_pane
    draw_preview_pane
}

# Main loop
main_loop() {
    local active_pane=0  # 0=editor, 1=preview
    local key

    draw_screen

    while true; do
        # Show cursor in status line to indicate active pane
        if [[ $active_pane -eq 0 ]]; then
            printf '\033[1;15H[EDITOR]'
        else
            printf '\033[1;15H[PREVIEW]'
        fi

        # Read key
        read -n 1 -s key

        case "$key" in
            $'\t')  # Tab - switch panes
                active_pane=$((1 - active_pane))
                ;;
            $'\n'|$'\r')  # Enter - edit file
                if [[ $active_pane -eq 0 ]]; then
                    open_editor
                fi
                ;;
            'q'|'Q')  # Quit
                break
                ;;
            'r'|'R')  # Refresh
                draw_screen
                ;;
            's'|'S')  # Save (if in editor)
                if [[ $active_pane -eq 0 ]]; then
                    printf '\033[%d;1H\033[7mSaved: %s\033[0m' "$ROWS" "$(date '+%H:%M:%S')"
                    sleep 1
                    draw_screen
                fi
                ;;
            $'\x1b')  # Escape sequence
                read -n 2 -s -t 0.1 key
                case "$key" in
                    '[A')  # Up arrow - scroll preview up
                        if [[ $active_pane -eq 1 ]]; then
                            # Could implement preview scrolling here
                            :
                        fi
                        ;;
                    '[B')  # Down arrow - scroll preview down
                        if [[ $active_pane -eq 1 ]]; then
                            # Could implement preview scrolling here
                            :
                        fi
                        ;;
                    'OP')  # F1
                        # Show help
                        printf '\033[%d;1H\033[7mF1:Help F2:Save Enter:Edit Tab:Switch R:Refresh Q:Quit\033[0m' "$ROWS"
                        sleep 2
                        draw_screen
                        ;;
                    'OQ')  # F2
                        printf '\033[%d;1H\033[7mPress Enter to edit, then save in your editor\033[0m' "$ROWS"
                        sleep 2
                        draw_screen
                        ;;
                    'OS')  # F4
                        break  # Alternative quit
                        ;;
                esac
                ;;
        esac
    done
}

# Main execution
main() {
    echo "Starting Markdown TUI for: $FILE"
    echo "Controls: Enter=Edit, Tab=Switch Panes, R=Refresh, Q=Quit"
    echo "Press any key to continue..."
    read -n 1 -s

    setup_terminal
    main_loop
}

# Run if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    if [[ $# -ne 1 ]]; then
        echo "Usage: $0 <markdown_file>"
        exit 1
    fi
    main "$@"
fi
