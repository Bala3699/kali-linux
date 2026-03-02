# 🐧 Bash Scripting Mastery — Level 8: Functions & Modular Programming

A structured documentation of learning **Functions in Bash**, focusing on modular script design, reusable logic blocks, and professional CLI structuring.

---

# 🧩 Introduction to Functions in Bash

As scripts grow in complexity, placing all logic inside loops or condition blocks makes them:

* Hard to read
* Difficult to maintain
* Difficult to reuse

Professional scripts solve this by:

* Splitting logic into functions
* Reusing code blocks
* Maintaining clean structure
* Following modular programming principles

---

# 🧠 Basic Function Syntax

```bash
function_name() {
    commands
}
```

Alternative syntax:

```bash
function function_name {
    commands
}
```

The first format is cleaner and more commonly used.

---

# 🔹 Simple Function Example

```bash
#!/bin/bash

greet() {
    echo "Hello Bala 👊"
}

greet
```

When `greet` is called, the function block executes.

---

# 🔥 Why Functions Matter

Without functions:

```bash
result=$(( num1 + num2 ))
echo "Result: $result"
```

With functions:

```bash
add() {
    result=$(( $1 + $2 ))
    echo "Result: $result"
}
```

Function call:

```bash
add 10 5
```

This improves readability and reusability.

---

# 🧠 Function Arguments

Inside a function:

* `$1` → First argument
* `$2` → Second argument
* `$#` → Number of arguments passed

Example:

```bash
add() {
    echo $(( $1 + $2 ))
}

add 4 6
```

Output:

```
10
```

---

# 🔥 Modular Calculator (Professional Version)

```bash
#!/bin/bash

add() {
    echo $(( $1 + $2 ))
}

subtract() {
    echo $(( $1 - $2 ))
}

multiply() {
    echo $(( $1 * $2 ))
}

divide() {
    if [ "$2" -eq 0 ]
    then
        echo "Error: Division by zero"
    else
        echo $(( $1 / $2 ))
    fi
}

modulus() {
    echo $(( $1 % $2 ))
}

while true
do
    echo "======= Calculator ======="
    read -p "Choose operator (+ - x / %) or exit: " ch

    if [ "$ch" = "exit" ]
    then
        echo "Exiting..."
        break
    fi

    read -p "Enter num1: " num1
    read -p "Enter num2: " num2

    case "$ch" in
        +) result=$(add "$num1" "$num2") ;;
        -) result=$(subtract "$num1" "$num2") ;;
        x) result=$(multiply "$num1" "$num2") ;;
        /) result=$(divide "$num1" "$num2") ;;
        %) result=$(modulus "$num1" "$num2") ;;
        *) echo "Invalid operator"; continue ;;
    esac

    echo "Result: $result"
    echo ""
done
```

---

# 🧠 New Concepts Learned

## 🔹 Modular Programming

Breaking large scripts into smaller reusable blocks.

## 🔹 Function Arguments

Passing values directly into logic blocks.

## 🔹 Command Substitution

```bash
result=$(function_name arguments)
```

Captures function output into a variable.

## 🔹 Cleaner CLI Structure

* Operator selection
* Exit control
* Case handling
* Reusable arithmetic blocks

---

# 🛡 Professional Upgrade — Input Validation

Real-world tools must validate user input.

If a user enters:

```
abc
```

The script may fail or behave unpredictably.

Basic numeric validation can be done using regex:

```bash
[[ "$num1" =~ ^[0-9]+$ ]]
```

This ensures only valid integers are processed.

---

# 🚀 Skills Acquired in This Level

* Function creation and structure
* Argument handling inside functions
* Modular design thinking
* Command substitution
* Cleaner and scalable CLI architecture
* Foundational input validation concepts

---

# 📈 Learning Progression So Far

You now understand:

* Variables & Input Handling
* Conditional Statements (`if`, `elif`, `else`)
* Argument Passing (`$1`, `$#`)
* Loops (`for`, `while`)
* `case` Statement
* Menu-Based Tools
* Continuous CLI Programs
* Functions & Modular Programming

---

🔐 _Next Phase: Advanced Input Validation, Exit Status Mastery, and Sec
