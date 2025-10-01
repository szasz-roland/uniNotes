# 📚 uniNotes: Your Comprehensive University Study Companion

A curated collection of university course notes, programming examples, and foundational knowledge.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-None-lightgrey)
![Stars](https://img.shields.io/github/stars/szasz-roland/uniNotes?style=social)
![Forks](https://img.shields.io/github/forks/szasz-roland/uniNotes?style=social)

![uniNotes Preview Image](/preview_example.png)
_Placeholder: A screenshot showing the directory structure or an example note._


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


## 🗺️ Project Roadmap

The `uniNotes` project is continuously evolving. Here are some planned future enhancements:

*   **Version 1.1.0**:
    *   Add more subjects and course materials.
    *   Expand `C#` and `Shell` programming examples with more complex scenarios.
    *   Implement a search function within `openNote.sh` to find notes by keyword.
*   **Version 1.2.0**:
    *   Introduce documentation for each programming example.
    *   Integrate a simple web-based interface for browsing notes (optional, long-term).
    *   Add unit tests for C# code examples where applicable.
*   **Future Goals**:
    *   Incorporate notes for additional primary languages.
    *   Community contributions for new subjects and improved content.


## 🤝 Contribution Guidelines

We welcome contributions to `uniNotes`! If you'd like to contribute, please follow these guidelines:

1.  **Fork the Repository**: Start by forking the `uniNotes` repository to your GitHub account.
2.  **Create a New Branch**:
    *   For new features: `feature/your-feature-name`
    *   For bug fixes: `fix/issue-description`
    *   For documentation: `docs/update-description`
3.  **Code Style**:
    *   **Shell Scripts**: Follow common shell scripting best practices (e.g., ShellCheck recommendations, clear variable names, comments).
    *   **C#**: Adhere to C# coding conventions (e.g., PascalCase for types/methods, camelCase for local variables, consistent formatting). Use `dotnet format` if available.
4.  **Commit Your Changes**: Make atomic commits with clear, descriptive messages.
5.  **Test Your Changes**: If you're adding new code or modifying existing functionality, ensure it works as expected. For C# code, consider adding unit tests.
6.  **Open a Pull Request (PR)**:
    *   Target the `main` branch of the `szasz-roland/uniNotes` repository.
    *   Provide a clear description of your changes and why they are beneficial.
    *   Reference any related issues.


## ⚖️ License Information

This project is currently **unlicensed**.

This means that by default, all rights are reserved by the copyright holder (szasz-roland). Without an explicit license, others do not have permission to use, reproduce, distribute, or modify this work. If you wish to use or contribute to this project, please contact the main contributor.