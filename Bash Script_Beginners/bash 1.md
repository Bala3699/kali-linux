# 🧠 Bash Scripting – Real World Master Guide (Phase 1)

A structured, practical Bash scripting guide built with real-world understanding.

This documentation focuses on:

* Real-time examples
* Essential options and flags
* Why commands are used
* Where they are used in real systems
* Writing clean, professional scripts

No shortcuts. No assumptions. Deep foundation.

---

# 🔹 1. Shebang – The Brain of the Script

```bash
#!/bin/bash
```

### What it means

* `#!` → Interpreter directive
* `/bin/bash` → Path to Bash interpreter

### Why it matters

Without a proper shebang, the system may execute the script using a different shell (like `sh`). This can break Bash-specific features.

### Check Bash path

```bash
which bash
```

### Real-world usage

On production servers, multiple shells may exist. The shebang guarantees consistent execution.

---

# 🔹 2. Comments – Professional Documentation

```bash
# This is a comment
```

Used to explain:

* Script purpose
* Author
* Date
* Input/output format

### Professional Example

```bash
#!/bin/bash
# Script: user_check.sh
# Purpose: Check if user exists
# Author: Bala
# Year: 2026
```

Clean documentation improves maintainability.

---

# 🔹 3. Variables – Core Building Block

```bash
name="Bala"
```

### Rules

* No spaces around `=`
* Case-sensitive
* No `$` while assigning

Accessing variable:

```bash
echo "$name"
```

---

## 🔹 Special Variables

| Variable | Meaning             |
| -------- | ------------------- |
| `$0`     | Script name         |
| `$1`     | First argument      |
| `$2`     | Second argument     |
| `$#`     | Number of arguments |
| `$?`     | Exit status         |
| `$$`     | Process ID          |
| `$USER`  | Current user        |

Example:

```bash
echo "Script name: $0"
echo "Arguments count: $#"
```

---

# 🔹 4. User Input – `read`

Basic usage:

```bash
read name
```

With prompt:

```bash
read -p "Enter your name: " name
```

### Important Flags

| Flag | Meaning                 |
| ---- | ----------------------- |
| `-p` | Prompt message          |
| `-s` | Silent (for passwords)  |
| `-t` | Timeout                 |
| `-n` | Read limited characters |

Example (password input):

```bash
read -s -p "Enter password: " pass
echo
```

Used in login utilities and internal automation tools.

---

# 🔹 5. Conditional Statements – Decision Making

```bash
if [ condition ]
then
    command
elif [ condition ]
then
    command
else
    command
fi
```

---

## 🔹 Numeric Comparison Operators

| Operator | Meaning          |
| -------- | ---------------- |
| `-eq`    | Equal            |
| `-ne`    | Not equal        |
| `-gt`    | Greater than     |
| `-lt`    | Less than        |
| `-ge`    | Greater or equal |
| `-le`    | Less or equal    |

Example:

```bash
if [ "$age" -ge 18 ]
```

---

## 🔹 String Operators

| Operator | Meaning   |
| -------- | --------- |
| `=`      | Equal     |
| `!=`     | Not equal |
| `-z`     | Empty     |
| `-n`     | Not empty |

Example:

```bash
if [ -z "$name" ]
```

---

# 🔹 6. Logical Operators

AND:

```bash
[ condition1 ] && [ condition2 ]
```

OR:

```bash
[ condition1 ] || [ condition2 ]
```

Example:

```bash
if [ "$age" -ge 18 ] && [ "$age" -le 60 ]
```

---

# 🔹 7. Loops – Automation Engine

## For Loop

```bash
for i in {1..5}
do
    echo "$i"
done
```

Used for batch processing, scanning ranges, iterating files.

---

## While Loop

```bash
count=1
while [ "$count" -le 5 ]
do
    echo "$count"
    ((count++))
done
```

Used in monitoring scripts and continuous checks.

---

# 🔹 8. Command Substitution

```bash
current=$(whoami)
```

Runs a command and stores its output.

Used in:

* System reporting
* Health checks
* Logging scripts

---

# 🔹 9. Exit Status – Critical in Automation

```bash
echo $?
```

* `0` → Success
* Non-zero → Failure

Example:

```bash
ping -c 1 8.8.8.8 > /dev/null

if [ $? -eq 0 ]
then
    echo "Host is reachable"
fi
```

Used in service monitoring and decision-based automation.

---

# 🔹 10. File Test Flags

| Flag | Meaning          |
| ---- | ---------------- |
| `-f` | File exists      |
| `-d` | Directory exists |
| `-r` | Readable         |
| `-w` | Writable         |
| `-x` | Executable       |
| `-e` | Exists           |

Example:

```bash
if [ -f "/etc/passwd" ]
```

Used before processing files in automation scripts.

---

# 🔥 Example: System Check Script Structure

```bash
#!/bin/bash

echo "User: $(whoami)"
echo "Date: $(date)"

ping -c 1 8.8.8.8 > /dev/null
if [ $? -eq 0 ]
then
    echo "Internet: Connected"
else
    echo "Internet: Not Connected"
fi

if [ -f /etc/passwd ]
then
    echo "/etc/passwd exists"
fi

df -h
```

This demonstrates how real administrative scripts are structured.

---

# 🚀 Learning Direction

Next phases will cover:

* Functions
* Case statements
* Script arguments in depth
* Text processing (`grep`, `awk`, `sed`)
* Building security-focused automation tools

---

# 📌 Final Note

This document represents a structured approach to mastering Bash scripting with practical clarity.

Foundation first. Automation next. Advanced tooling later.

**Author:** Bala
**Focus:** Linux • Bash • Automation • Cybersecurity Foundations
