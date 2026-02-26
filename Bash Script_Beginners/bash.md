# 🐧 Bash Scripting Mastery – From Zero to Automation

A structured, hands-on Bash learning journey documented from absolute beginner level.

This repository is built with one goal:

> Build strong Bash fundamentals step-by-step with clarity, structure, and real understanding.

No assumptions. No shortcuts. No copied scripts.

---

# 📌 Why Learn Bash?

Bash is the default shell in most Linux systems.

It allows you to:

* Automate repetitive tasks
* Control system operations
* Write small programs
* Build security tools
* Manage servers efficiently

For anyone working in:

* Linux Administration
* DevOps
* Cybersecurity
* Automation Engineering

Bash is foundational.

---

# 🧱 Learning Foundation

This documentation starts from absolute zero.

## 1️⃣ Understanding Bash

Bash (Bourne Again Shell) is:

* A command interpreter
* A scripting language
* The interface between user and Linux kernel

Every command typed in terminal is executed through Bash.

---

# 🗂 Module 1 – Creating Your First Script

### Creating a script file

```bash
nano first.sh
```

### Basic script structure

```bash
#!/bin/bash
echo "Hello World"
```

### Making it executable

```bash
chmod +x first.sh
```

### Running the script

```bash
./first.sh
```

### Key Concepts Learned

* What a script is
* Execution permissions
* The shebang (`#!/bin/bash`)
* Basic output using `echo`

---

# 🗂 Module 2 – Variables

Variables store data inside scripts.

```bash
name="Bala"
echo "My name is $name"
```

### Rules Learned

* No `$` while assigning
* Use `$` while accessing
* Strings must be quoted properly

---

# 🗂 Module 3 – User Input

Making scripts interactive.

```bash
#!/bin/bash

echo "Enter your name:"
read username

echo "Hello $username"
```

### Concepts Learned

* `read` command
* Storing user input
* Printing dynamic values

---

# 🗂 Module 4 – Conditional Statements

Teaching Bash to make decisions.

```bash
#!/bin/bash

echo "Enter a number:"
read num

if [ $num -gt 10 ]
then
    echo "Number is greater than 10"
else
    echo "Number is 10 or less"
fi
```

### Concepts Learned

* `if` structure
* Comparison operators (`-gt`, `-lt`, `-eq`)
* Logical flow control

---

# 🗂 Module 5 – Loops

Repeating tasks efficiently.

```bash
#!/bin/bash

for i in 1 2 3 4 5
do
    echo "Number $i"
done
```

### Concepts Learned

* `for` loop structure
* Iteration
* Automation basics

---

# 🗂 Module 6 – Command Substitution

Capturing command output inside variables.

```bash
#!/bin/bash

user=$(whoami)
echo "Logged in as $user"
```

### Concepts Learned

* `$( )` command substitution
* Dynamic data retrieval
* System information inside scripts

---

# 🎯 Skills Built So Far

* Writing executable Bash scripts
* Understanding script structure
* Using variables properly
* Handling user input
* Writing conditional logic
* Creating loops
* Capturing system command output

---

# 🚀 Learning Approach

This repository follows a strict principle:

* Learn concept
* Write script manually
* Understand why it works
* Avoid memorization without logic

The goal is not just to write scripts —

The goal is to understand how Bash thinks.

---

# 🛡 Future Direction

Next phases will include:

* File handling in scripts
* Checking file existence
* Working with numbers properly
* Text processing basics
* Simple automation projects
* Security-focused Bash use cases

---

# 📌 Final Note

This documentation represents the beginning of a structured Bash scripting journey.

From absolute beginner → toward automation proficiency.

Step-by-step. Clean foundation. Strong logic.

---

**Author:** Bala
**Focus:** Linux • Bash • Automation • Cybersecurity Foundations
