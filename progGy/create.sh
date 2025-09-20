#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
DEFAULT_VERSION="8.0"
PROJECT_TYPE="console"

# Function to show usage
show_usage() {
    echo -e "${BLUE}Usage:${NC}"
    echo "  $0 [-v|--version VERSION] [-t|--type TYPE] PROJECT_NAME"
    echo "  $0 -h|--help"
    echo ""
    echo -e "${BLUE}Options:${NC}"
    echo "  -v, --version VERSION    .NET version (6.0, 7.0, 8.0, 9.0) [default: $DEFAULT_VERSION]"
    echo "  -t, --type TYPE          Project type (console, webapi, mvc, classlib, blazor) [default: $PROJECT_TYPE]"
    echo "  -h, --help              Show this help message"
    echo ""
    echo -e "${BLUE}Examples:${NC}"
    echo "  $0 MyProject                    # Creates console app with .NET $DEFAULT_VERSION"
    echo "  $0 -v 7.0 MyProject             # Creates console app with .NET 7.0"
    echo "  $0 -v 8.0 -t webapi MyApi       # Creates Web API with .NET 8.0"
    echo "  $0 --version 9.0 MyProject      # Creates console app with .NET 9.0"
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
        echo -e "${YELLOW}Project will be created but VS Code won't open automatically${NC}"
        return 1
    fi
    return 0
}

# Function to validate .NET version
validate_version() {
    local version=$1
    case $version in
        6.0|7.0|8.0|9.0)
            return 0
            ;;
        *)
            echo -e "${RED}Error: Invalid .NET version '$version'${NC}"
            echo -e "${YELLOW}Supported versions: 6.0, 7.0, 8.0, 9.0${NC}"
            return 1
            ;;
    esac
}

# Function to validate project type
validate_project_type() {
    local type=$1
    case $type in
        console|webapi|mvc|classlib|blazor|blazorserver)
            return 0
            ;;
        *)
            echo -e "${RED}Error: Invalid project type '$type'${NC}"
            echo -e "${YELLOW}Supported types: console, webapi, mvc, classlib, blazor, blazorserver${NC}"
            return 1
            ;;
    esac
}

# Function to check if project directory already exists
check_project_exists() {
    local project_name=$1
    if [ -d "$project_name" ]; then
        echo -e "${RED}Error: Directory '$project_name' already exists${NC}"
        read -p "Do you want to remove it and continue? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rm -rf "$project_name"
            echo -e "${YELLOW}Removed existing directory${NC}"
        else
            echo -e "${YELLOW}Operation cancelled${NC}"
            exit 1
        fi
    fi
}

# Function to create the project
create_project() {
    local project_name=$1
    local version=$2
    local type=$3

    echo -e "${BLUE}Creating .NET $version $type project: $project_name${NC}"

    # Create the project
    if dotnet new $type -n "$project_name" --framework "net$version"; then
        echo -e "${GREEN}✓ Project created successfully${NC}"
    else
        echo -e "${RED}✗ Failed to create project${NC}"
        exit 1
    fi
}

# Function to add version info to Program.cs (for console apps)
add_version_info() {
    local project_name=$1
    local type=$2

    if [ "$type" = "console" ]; then
        local program_file="$project_name/Program.cs"
        if [ -f "$program_file" ]; then
            # Create a new Program.cs with version info
            cat > "$program_file" << 'EOF'
using System;
using System.Runtime.InteropServices;

Console.WriteLine("Hello, World!");
Console.WriteLine($"Running on: {RuntimeInformation.FrameworkDescription}");
Console.WriteLine($"Runtime Version: {Environment.Version}");
Console.WriteLine($"OS: {RuntimeInformation.OSDescription}");
EOF
            echo -e "${GREEN}✓ Added version information to Program.cs${NC}"
        fi
    fi
}

# Function to run the project
run_project() {
    local project_name=$1

    echo -e "${BLUE}Running the project...${NC}"
    cd "$project_name"

    # Build and run
    if dotnet run; then
        echo -e "${GREEN}✓ Project ran successfully${NC}"
    else
        echo -e "${YELLOW}⚠ Project creation completed but run failed${NC}"
    fi

    cd ..
}

# Function to open VS Code
open_vscode() {
    local project_name=$1

    if check_vscode; then
        echo -e "${BLUE}Opening VS Code...${NC}"
        code "$project_name"
        echo -e "${GREEN}✓ VS Code opened${NC}"
    fi
}

# Parse command line arguments
VERSION="$DEFAULT_VERSION"
TYPE="$PROJECT_TYPE"
PROJECT_NAME=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -v|--version)
            VERSION="$2"
            shift 2
            ;;
        -t|--type)
            TYPE="$2"
            shift 2
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
            if [ -z "$PROJECT_NAME" ]; then
                PROJECT_NAME="$1"
            else
                echo -e "${RED}Error: Multiple project names specified${NC}"
                show_usage
                exit 1
            fi
            shift
            ;;
    esac
done

# Check if project name is provided
if [ -z "$PROJECT_NAME" ]; then
    echo -e "${RED}Error: Project name is required${NC}"
    show_usage
    exit 1
fi

# Main execution
main() {
    echo -e "${GREEN}🚀 .NET Project Creator${NC}"
    echo "================================"

    # Perform checks
    check_dotnet

    if ! validate_version "$VERSION"; then
        exit 1
    fi

    if ! validate_project_type "$TYPE"; then
        exit 1
    fi

    check_project_exists "$PROJECT_NAME"

    # Show what will be created
    echo -e "${BLUE}Project Details:${NC}"
    echo "  Name: $PROJECT_NAME"
    echo "  Type: $TYPE"
    echo "  .NET Version: $VERSION"
    echo ""

    # Create and setup project
    create_project "$PROJECT_NAME" "$VERSION" "$TYPE"
    add_version_info "$PROJECT_NAME" "$TYPE"
    run_project "$PROJECT_NAME"
    open_vscode "$PROJECT_NAME"

    echo ""
    echo -e "${GREEN}✓ All done! Happy coding! 🎉${NC}"
    echo -e "${BLUE}To work with your project:${NC}"
    echo "  cd $PROJECT_NAME"
    echo "  dotnet run"
}

# Run main function
main
