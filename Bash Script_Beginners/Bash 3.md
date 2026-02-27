# 🐧 Bash Scripting Mastery — Level 6: `case` Statement & Menu-Based Tools

A structured documentation of learning the **`case` statement in Bash scripting**, focusing on building clean, scalable, and professional menu-driven command-line tools.

---

## 📌 Why `case` Statement?

When scripts grow and require multiple decision branches, using repeated `if-elif-else` conditions becomes difficult to read and maintain.

The `case` statement provides:

* Cleaner structure
* Better readability
* Professional multi-option handling
* Scalable menu system design

---

## 🧠 Basic Syntax

```bash
case variable in
    value1)
        command
        ;;
    value2)
        command
        ;;
    *)
        default command
        ;;
esac
```

### 🔎 Key Components

* `;;` → Terminates each case block
* `*)` → Default block (similar to `else`)
* `esac` → Ends the case statement (`case` spelled backward)

---

## 🟢 Basic Menu Example

```bash
#!/bin/bash

echo "Choose option:"
echo "1. Show Date"
echo "2. Show User"
echo "3. Show Current Directory"
echo "4. Exit"

read choice

case "$choice" in
    1)
        date
        ;;
    2)
        whoami
        ;;
    3)
        pwd
        ;;
    4)
        echo "Goodbye"
        ;;
    *)
        echo "Invalid option"
        ;;
esac
```

### 💡 What This Demonstrates

* Interactive input handling
* Multi-branch decision making
* Basic system command execution
* Default error handling

---

## 🟢 Advanced Example — System Utility Tool

```bash
#!/bin/bash

echo "===== System Tool ====="
echo "1. Check Internet"
echo "2. Check File"
echo "3. Disk Usage"
echo "4. Exit"

read option

case "$option" in
    1)
        ping -c 1 8.8.8.8 > /dev/null
        if [ $? -eq 0 ]
        then
            echo "Internet is working"
        else
            echo "No internet"
        fi
        ;;
    2)
        read -p "Enter filename: " file
        if [ -f "$file" ]
        then
            echo "File exists"
        else
            echo "File not found"
        fi
        ;;
    3)
        df -h
        ;;
    4)
        echo "Exiting..."
        ;;
    *)
        echo "Invalid option"
        ;;
esac
```

---

## 🚀 Skills Acquired in This Level

* Writing structured multi-option scripts
* Designing interactive menu systems
* Combining `case` with `if` conditions
* Using exit status `$?` inside logic
* Building small system utility tools
* Improving script readability and maintainability

---

## 🛠 Practical Applications

The `case` statement is commonly used in:

* CLI utilities
* Automation scripts
* Administrative tools
* System management scripts
* Security and monitoring scripts

It forms the foundation for building **real-world command-line applications**.

---

## 📈 Learning Progression

With this level completed, the scripting journey now includes:

* Variables & Input Handling
* Conditional Statements (`if`, `elif`, `else`)
* Loops (`for`)
* Functions
* File Checking & Flags
* Argument Handling
* `case` Statement & Menu Systems

This marks the transition from basic scripting to structured automation development.

---

🔐 *Next Phase: While Loops, Input Validation, and Advanced Script Control Flow.*
