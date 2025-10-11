# 📚 uniNotes: Your Comprehensive University Study Companion

A curated collection of university course notes, programming examples, and foundational knowledge.

![License](https://img.shields.io/badge/license-None-lightgrey)

## ✨ Features

*   **Organized Course Materials**: 📁 Easily navigate through structured notes for various university subjects.
*   **Quick Access Script**: 🚀 Utilize `openNote.sh` for swift command-line access to your study materials.
*   **Practical Programming Examples**: 💡 Dive into `C#` and `Shell` programming exercises (`progEa`, `progGy`, `impProgEa`, `impProgGy`) to solidify your understanding.
*   **Mathematical Foundations**: ➕ Explore `matAlap` (Mathematical Fundamentals) for core concepts and problem-solving.
*   **System Fundamentals**: 🖥️ Review `szamRend` (Number Systems/Computer Architecture) for essential computing knowledge.


## 🚀 Installation Guide

To get a local copy of uniNotes up and running, follow these simple steps.

### Prerequisites

Before you begin, ensure you have the following installed:

*   **Git**: For cloning the repository.
*   **Shell Environment**: A Unix-like environment (Linux, macOS, WSL for Windows) to run shell scripts.
*   **.NET SDK**: If you plan to compile and run the C# programs.

### Manual Installation

1.  **Clone the Repository**:
    Open your terminal or command prompt and clone the `uniNotes` repository:

    ```bash
    git clone https://github.com/szasz-roland/uniNotes.git
    cd uniNotes
    ```

2.  **Make Shell Scripts Executable**:
    Ensure the `openNote.sh` script (and any other `.sh` scripts) has execute permissions:

    ```bash
    chmod +x openNote.sh
    ```

3.  **C# Programs (Optional)**:
    If you wish to compile or run the C# programs (e.g., in `progEa`, `progGy`), navigate to their respective directories and use the .NET CLI:

    ```bash
    # Example for a C# project named 'MyCSharpProject'
    cd progEa/MyCSharpProject
    dotnet build
    dotnet run
    ```


## 💡 Usage Examples

### Accessing Notes with `openNote.sh`

The `openNote.sh` script is designed to help you quickly open specific note directories.

1.  **List available modules/notes**:

    ```bash
    ./openNote.sh help
    ```

2.  **Open a specific module's directory**:
    This will open the directory in your default file explorer or terminal, depending on your system configuration.

    ```bash
    ./openNote.sh matAlap
    ```

    Or for programming exercises:

    ```bash
    ./openNote.sh progEa
    ```

### Browsing Manually

You can also navigate through the project structure directly using your file explorer or terminal:

```bash
# To see all available folders
ls -F

# To go into a specific course material
cd matAlap
ls
```

### Running C# Examples

For C# projects, navigate to the project directory and use `dotnet run`:

```bash
cd progEa/example_csharp_project # Replace with actual project path
dotnet run
```

## ⚖️ License Information

This project is currently **unlicensed**.

This means that by default, all rights are reserved by the copyright holder (szasz-roland). Without an explicit license, others do not have permission to use, reproduce, distribute, or modify this work. If you wish to use or contribute to this project, please contact the main contributor.
