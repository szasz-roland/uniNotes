#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to show usage
show_usage() {
    echo -e "${BLUE}Usage:${NC}"
    echo "  $0 [OPTIONS] PROJECT_PATH"
    echo "  $0 -h|--help"
    echo ""
    echo -e "${BLUE}Options:${NC}"
    echo "  -r, --run               Run the project after opening"
    echo "  -b, --build             Build the project before running"
    echo "  -c, --clean             Clean the project before building"
    echo "  -v, --verbose           Show detailed output"
    echo "  -n, --no-vscode         Don't open VS Code"
    echo "  -l, --list              List all .NET projects in current directory"
    echo "  -i, --info              Show project information"
    echo "  -h, --help              Show this help message"
    echo ""
    echo -e "${BLUE}Examples:${NC}"
    echo "  $0 MyProject                        # Open project in VS Code"
    echo "  $0 -r MyProject                     # Open and run project"
    echo "  $0 -b -r MyProject                  # Build, then run project"
    echo "  $0 -c -b -r MyProject               # Clean, build, then run"
    echo "  $0 -i MyProject                     # Show project info only"
    echo "  $0 -l                               # List all .NET projects"
    echo "  $0 --no-vscode --run MyProject      # Run without opening VS Code"
}

# Function to check if dotnet is installed
check_dotnet() {
    if ! command -v dotnet &> /dev/null; then
        echo -e "${RED}Error: dotnet CLI is not installed or not in PATH${NC}"
        exit 1
    fi
}

# Function to check if VS Code is installed
check_vscode() {
    if ! command -v code &> /dev/null; then
        echo -e "${YELLOW}Warning: VS Code (code command) not found in PATH${NC}"
        return 1
    fi
    return 0
}

# Function to find project file
find_project_file() {
    local project_path=$1

    if [ ! -d "$project_path" ]; then
        echo -e "${RED}Error: Directory '$project_path' does not exist${NC}"
        return 1
    fi

    # Look for .csproj, .fsproj, or .vbproj files
    local project_files=($(find "$project_path" -maxdepth 1 -name "*.csproj" -o -name "*.fsproj" -o -name "*.vbproj" 2>/dev/null))

    if [ ${#project_files[@]} -eq 0 ]; then
        echo -e "${RED}Error: No .NET project file found in '$project_path'${NC}"
        echo -e "${YELLOW}Looking for: *.csproj, *.fsproj, or *.vbproj files${NC}"
        return 1
    elif [ ${#project_files[@]} -gt 1 ]; then
        echo -e "${YELLOW}Warning: Multiple project files found:${NC}"
        for file in "${project_files[@]}"; do
            echo "  - $(basename "$file")"
        done
        echo -e "${BLUE}Using: $(basename "${project_files[0]}")${NC}"
    fi

    echo "${project_files[0]}"
    return 0
}

# Function to show project information
show_project_info() {
    local project_path=$1
    local project_file

    project_file=$(find_project_file "$project_path")
    if [ $? -ne 0 ]; then
        return 1
    fi

    echo -e "${BLUE}Project Information:${NC}"
    echo "================================"
    echo "  Path: $project_path"
    echo "  Project File: $(basename "$project_file")"

    # Get framework version from project file
    if [ -f "$project_file" ]; then
        local framework=$(grep -oP '(?<=<TargetFramework>)[^<]+' "$project_file" 2>/dev/null)
        if [ -n "$framework" ]; then
            echo "  Target Framework: $framework"
        fi

        local frameworks=$(grep -oP '(?<=<TargetFrameworks>)[^<]+' "$project_file" 2>/dev/null)
        if [ -n "$frameworks" ]; then
            echo "  Target Frameworks: $frameworks"
        fi
    fi

    # Check if it's a solution directory
    local solution_files=($(find "$project_path" -maxdepth 1 -name "*.sln" 2>/dev/null))
    if [ ${#solution_files[@]} -gt 0 ]; then
        echo "  Solution File: $(basename "${solution_files[0]}")"
    fi

    # Show restore status
    echo ""
    echo -e "${BLUE}Checking dependencies...${NC}"
    cd "$project_path"
    if dotnet list package &>/dev/null; then
        echo -e "${GREEN}✓ Dependencies are restored${NC}"
    else
        echo -e "${YELLOW}⚠ Dependencies may need to be restored${NC}"
    fi
    cd - > /dev/null

    echo ""
}

# Function to list all .NET projects in current directory
list_projects() {
    echo -e "${BLUE}Searching for .NET projects...${NC}"
    echo "================================"

    local found=0

    # Find directories with project files
    for dir in */; do
        if [ -d "$dir" ]; then
            local project_files=($(find "$dir" -maxdepth 1 -name "*.csproj" -o -name "*.fsproj" -o -name "*.vbproj" 2>/dev/null))
            if [ ${#project_files[@]} -gt 0 ]; then
                found=1
                echo -e "${GREEN}📁 ${dir%/}${NC}"
                for file in "${project_files[@]}"; do
                    local framework=$(grep -oP '(?<=<TargetFramework>)[^<]+' "$file" 2>/dev/null)
                    if [ -n "$framework" ]; then
                        echo "   └── $(basename "$file") ($framework)"
                    else
                        echo "   └── $(basename "$file")"
                    fi
                done
                echo ""
            fi
        fi
    done

    # Also check current directory
    local project_files=($(find . -maxdepth 1 -name "*.csproj" -o -name "*.fsproj" -o -name "*.vbproj" 2>/dev/null))
    if [ ${#project_files[@]} -gt 0 ]; then
        found=1
        echo -e "${GREEN}📁 . (current directory)${NC}"
        for file in "${project_files[@]}"; do
            local framework=$(grep -oP '(?<=<TargetFramework>)[^<]+' "$file" 2>/dev/null)
            if [ -n "$framework" ]; then
                echo "   └── $(basename "$file") ($framework)"
            else
                echo "   └── $(basename "$file")"
            fi
        done
    fi

    if [ $found -eq 0 ]; then
        echo -e "${YELLOW}No .NET projects found in current directory${NC}"
        return 1
    fi

    return 0
}

# Function to clean project
clean_project() {
    local project_path=$1
    local verbose=$2

    echo -e "${BLUE}Cleaning project...${NC}"
    cd "$project_path"

    if [ "$verbose" = true ]; then
        dotnet clean
    else
        dotnet clean > /dev/null 2>&1
    fi

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Project cleaned successfully${NC}"
    else
        echo -e "${RED}✗ Failed to clean project${NC}"
        cd - > /dev/null
        return 1
    fi

    cd - > /dev/null
    return 0
}

# Function to build project
build_project() {
    local project_path=$1
    local verbose=$2

    echo -e "${BLUE}Building project...${NC}"
    cd "$project_path"

    if [ "$verbose" = true ]; then
        dotnet build
    else
        dotnet build > /dev/null 2>&1
    fi

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Project built successfully${NC}"
    else
        echo -e "${RED}✗ Failed to build project${NC}"
        cd - > /dev/null
        return 1
    fi

    cd - > /dev/null
    return 0
}

# Function to run project
run_project() {
    local project_path=$1

    echo -e "${BLUE}Running project...${NC}"
    cd "$project_path"

    echo -e "${YELLOW}Press Ctrl+C to stop the application${NC}"
    echo "================================"

    dotnet run
    local exit_code=$?

    echo "================================"
    if [ $exit_code -eq 0 ]; then
        echo -e "${GREEN}✓ Project finished successfully${NC}"
    else
        echo -e "${YELLOW}⚠ Project exited with code: $exit_code${NC}"
    fi

    cd - > /dev/null
    return $exit_code
}

# Function to open VS Code
open_vscode() {
    local project_path=$1

    if check_vscode; then
        echo -e "${BLUE}Opening VS Code...${NC}"
        code "$project_path"
        echo -e "${GREEN}✓ VS Code opened${NC}"
        return 0
    else
        echo -e "${YELLOW}VS Code not available, skipping...${NC}"
        return 1
    fi
}

# Parse command line arguments
RUN_PROJECT=false
BUILD_PROJECT=false
CLEAN_PROJECT=false
VERBOSE=false
OPEN_VSCODE=true
LIST_PROJECTS=false
SHOW_INFO=false
PROJECT_PATH=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -r|--run)
            RUN_PROJECT=true
            shift
            ;;
        -b|--build)
            BUILD_PROJECT=true
            shift
            ;;
        -c|--clean)
            CLEAN_PROJECT=true
            shift
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -n|--no-vscode)
            OPEN_VSCODE=false
            shift
            ;;
        -l|--list)
            LIST_PROJECTS=true
            shift
            ;;
        -i|--info)
            SHOW_INFO=true
            shift
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        -*)
            echo -e "${RED}Error: Unknown option $1${NC}"
            show_usage
            exit 1
            ;;
        *)
            if [ -z "$PROJECT_PATH" ]; then
                PROJECT_PATH="$1"
            else
                echo -e "${RED}Error: Multiple project paths specified${NC}"
                show_usage
                exit 1
            fi
            shift
            ;;
    esac
done

# Main execution
main() {
    echo -e "${GREEN}🔧 .NET Project Opener${NC}"
    echo "================================"

    # Check dotnet installation
    check_dotnet

    # Handle list projects option
    if [ "$LIST_PROJECTS" = true ]; then
        list_projects
        exit $?
    fi

    # Check if project path is provided
    if [ -z "$PROJECT_PATH" ]; then
        echo -e "${RED}Error: Project path is required${NC}"
        echo ""
        show_usage
        exit 1
    fi

    # Verify project exists and is valid
    if ! find_project_file "$PROJECT_PATH" > /dev/null; then
        exit 1
    fi

    # Show project information if requested
    if [ "$SHOW_INFO" = true ]; then
        show_project_info "$PROJECT_PATH"
        if [ "$RUN_PROJECT" = false ] && [ "$BUILD_PROJECT" = false ] && [ "$CLEAN_PROJECT" = false ]; then
            exit 0
        fi
        echo ""
    fi

    echo -e "${BLUE}Working with project: $PROJECT_PATH${NC}"
    echo ""

    # Execute requested operations in order
    if [ "$CLEAN_PROJECT" = true ]; then
        clean_project "$PROJECT_PATH" "$VERBOSE"
        if [ $? -ne 0 ]; then
            exit 1
        fi
        echo ""
    fi

    if [ "$BUILD_PROJECT" = true ]; then
        build_project "$PROJECT_PATH" "$VERBOSE"
        if [ $? -ne 0 ]; then
            exit 1
        fi
        echo ""
    fi

    if [ "$OPEN_VSCODE" = true ]; then
        open_vscode "$PROJECT_PATH"
        echo ""
    fi

    if [ "$RUN_PROJECT" = true ]; then
        run_project "$PROJECT_PATH"
        echo ""
    fi

    echo -e "${GREEN}✓ All operations completed! 🎉${NC}"

    if [ "$OPEN_VSCODE" = false ] && [ "$RUN_PROJECT" = false ]; then
        echo -e "${BLUE}To work with your project:${NC}"
        echo "  cd $PROJECT_PATH"
        echo "  dotnet run"
    fi
}

# Run main function
main
