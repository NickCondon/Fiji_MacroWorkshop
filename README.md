# Fiji Macro Writing Workshop

<img src="https://imagej.net/media/icons/fiji.png" width="100">

A practical introduction to **writing macros in Fiji/ImageJ** to automate repetitive image-processing and analysis tasks.

The **ImageJ Macro Language (IJM)** is a scripting language built into ImageJ. It allows you to automate sequences of commands, work with images and ROIs, process batches of files, interact with users, and build reproducible image-analysis workflows.

Fiji is a **“batteries-included” distribution of ImageJ**, combining ImageJ with a large collection of plugins and tools for scientific image analysis.

**No previous programming experience is required.**

This workshop was written by Dr Nicholas Condon from the Institute for Molecular Bioscience, The University of Queensland.

## 🎯 Learning Outcomes
By the end of this workshop, you should be able to:
- Write and modify basic Fiji macros
- Use variables, operators and comments
- Use conditional statements and loops
- Work with arrays and functions
- Work with images, stacks and ROIs
- Process batches of images
- Create simple dialogs and interact with users

## 📚 Workshop Materials
The main workshop materials are provided as PDFs, with exercises and example files contained in the repository
Resource	Description
| Resource                               | Description                        |
| -------------------------------------- | ---------------------------------- |
| 📕 [Workshop Booklet](Booklet.pdf)     | Slides, explanations and exercises |
| 📋 [Macro Cheat Sheet](CheatSheet.pdf) | Frequently used IJM commands       |
| 🧩 [Exercises](Exercises/)             | Exercise files and solutions       |

The **Booklet** contains the workshop slides and exercise instructions. Required files and example data are provided in the relevant exercise folders, along with answers where appropriate.

## Getting Started
### 1. Install Fiji

Download and install Fiji before the workshop:
**[Download Fiji](https://fiji.sc/)**

You don't need to install any additional macro-writing software — the **ImageJ Macro Language is built into Fiji**.

### 2. Download this workshop repository

You will need a local copy of this repository so that you have access to the workshop booklet, exercises, example images and scripts.

#### Download as a ZIP

The easiest option is to download the repository as a ZIP file.

1. At the top of this GitHub page, click the green **`<> Code`** button.
2. Select **Download ZIP**.
3. Extract the downloaded ZIP file somewhere convenient on your computer.
4. Open the extracted `Fiji_MacroWorkshop` folder.

You should see files and folders similar to:

```text
Fiji_MacroWorkshop/
├── Booklet.pdf
├── CheatSheet.pdf
└── Exercises/
```

> **Important:** Make sure you **extract the ZIP file** before starting the exercises. Don't try to work directly from inside the ZIP file.

## 📋 Workshop Topics

The workshop covers the fundamentals of Fiji macro programming:

* Variables and operators
* Comments and printing
* Conditional statements
* Loops
* Arrays
* Functions
* Images and stacks
* Files and directories
* Dialogs and user input
* Debugging
* Useful built-in functions
* Automating repetitive image-analysis tasks

## 📁 Repository Structure

The repository is organised roughly as follows:

```text
Fiji_MacroWorkshop/
│
├── Booklet.pdf
├── CheatSheet.pdf
│
└── Exercises/
    ├── Exercise1/
    ├── Exercise2/
    ├── Exercise3/
    └── ...
```


## External Documentation

📖 **[ImageJ Macro Language – Introduction](https://imagej.net/scripting/macro)**
A good starting point for learning how to write ImageJ macros.

📚 **[ImageJ Macro Language – Function Reference](https://imagej.net/ij/developer/macro/functions.html)**
The complete reference for built-in macro functions.

🧰 **[Fiji Scripting Toolbox](https://imagej.net/scripting/toolbox)**
Useful code snippets and examples for common tasks.

📘 **[ImageJ User Guides](https://imagej.net/learn/user-guides)**
Broader ImageJ documentation and tutorials.

---

> 💡 **Tip:** When you're not sure how to write a command, use the **Macro Recorder**. Perform the action manually in Fiji and see what code it generates. Then modify the recorded code to make it reusable and automated.

> 💡 **Tip2:** Use the [Script shell generator](https://github.com/NickCondon/Fiji_MacroWorkshop/blob/main/Exercises/Exercise6/Script_Shell_Generator_V2.ijm) to get started with all of file directory and main outline code already written. Just run the script, fill in the dialog, and copy the log window into a new script window.
