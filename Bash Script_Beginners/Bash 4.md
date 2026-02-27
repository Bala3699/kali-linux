# 🐧 Bash Scripting Mastery — Level 7: `while` Loop & Continuous CLI Programs

A structured documentation of learning the **`while` loop in Bash scripting**, focusing on building continuous, interactive command-line tools similar to real-world CLI applications.

---

# 🔁 Understanding the `while` Loop

Unlike simple scripts that execute once and terminate, professional CLI tools:

* Continue running
* Wait for user input repeatedly
* Exit only when explicitly instructed

The `while` loop enables this behavior.

---

## 🧠 Basic Syntax

```bash
while condition
do
    commands
done
```

### Example: Infinite Loop

```bash
while true
do
    echo "Hello"
done
```

⚠ This creates an infinite loop.

To stop execution, we use:

* `break` → immediately exits the loop
* A logical condition that eventually becomes false

---

# 🔥 Building a Continuous Calculator (Interactive CLI Tool)

This upgraded calculator runs continuously until the user decides to exit.

```bash
#!/bin/bash

while true
do
    echo "===== Calculator ====="
    read -p "Enter first number: " num1
    read -p "Enter second number: " num2

    echo "Choose operator:"
    echo "+  -  x  /  %"
    echo "Type exit to quit"

    read -p "Enter choice: " ch

    case "$ch" in
        +)
            result=$(( num1 + num2 ))
            echo "Result: $result"
            ;;
        -)
            result=$(( num1 - num2 ))
            echo "Result: $result"
            ;;
        x)
            result=$(( num1 * num2 ))
            echo "Result: $result"
            ;;
        /)
            if [ "$num2" -eq 0 ]
            then
                echo "Error: Division by zero"
            else
                result=$(( num1 / num2 ))
                echo "Result: $result"
            fi
            ;;
        %)
            result=$(( num1 % num2 ))
            echo "Result: $result"
            ;;
        exit)
            echo "Exiting calculator..."
            break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac

    echo ""
done
```

---

# 🧠 Key Concepts Learned

## 🔹 `while true`

Creates a continuous execution loop.

## 🔹 `break`

Immediately exits the loop and ends the program.

## 🔹 Execution Flow

1. Loop starts
2. User provides input
3. `case` evaluates operation
4. Result is displayed
5. Loop repeats
6. `exit` triggers `break`

---

# 🚀 Professional Design Improvement

A more user-friendly approach improves program flow:

* Ask for operator first
* If operator = `exit` → break immediately
* Otherwise request numeric input
* Perform calculation

This enhances user experience and prevents unnecessary prompts.

---

# 🛠 Skills Acquired in This Level

* Continuous program execution
* Loop control using `break`
* Combining `while` with `case`
* Building interactive CLI utilities
* Basic user experience flow improvement
* Error handling (e.g., division by zero)

---

# 📈 Learning Progression So Far

You now understand:

* Variables & Input Handling
* Conditional Statements (`if`, `elif`, `else`)
* Argument Passing (`$1`, `$#`)
* Loops (`for`, `while`)
* Functions
* File Checking & Flags
* `case` Statement
* Interactive Menu Systems
* Continuous CLI Tool Development

---

🔐 *Next Phase: Input Validation, Exit Status Mastery, and Advanced Script Control Flow.*
