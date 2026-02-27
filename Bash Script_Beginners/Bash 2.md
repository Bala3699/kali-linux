# 🧠 Bash Scripting Mastery – Level 2 Progression

A structured continuation of the Bash learning journey, moving from beginner fundamentals to practical scripting skills used in real-world environments.

This phase focuses on:

* Script arguments
* Automation with loops
* Writing reusable functions
* File validation and checks
* Writing professional-style scripts

---

# 🟢 Level 2 — Script Arguments

Until now, scripts accepted input using `read` after execution.

Now we pass values directly while running the script.

Example:

```bash
./script.sh Bala 25
```

Inside the script:

| Symbol | Meaning             |
| ------ | ------------------- |
| `$0`   | Script name         |
| `$1`   | First argument      |
| `$2`   | Second argument     |
| `$#`   | Number of arguments |

### Basic Example

```bash
#!/bin/bash

echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Total arguments: $#"
```

### Real-World Use

Professional scripts use arguments for flexibility:

```bash
./scan.sh 192.168.1.10
```

The IP address is passed dynamically instead of hardcoding values.

---

# 🟢 Level 3 — For Loops (Automation Power)

Loops eliminate repetition and enable automation.

## Basic Loop

```bash
#!/bin/bash

for i in 1 2 3 4 5
do
    echo "Number: $i"
done
```

## Range Loop

```bash
for i in {1..5}
do
    echo "$i"
done
```

## Practical Example — Ping Multiple Hosts

```bash
#!/bin/bash

for i in {1..5}
do
    ping -c 1 127.0.0.$i > /dev/null
    if [ $? -eq 0 ]
    then
        echo "127.0.0.$i is reachable"
    fi
done
```

This demonstrates automated host checking, commonly used in administrative scripts.

---

# 🟢 Level 4 — Functions (Professional Structure)

Functions organize code into reusable blocks.

```bash
#!/bin/bash

greet() {
    echo "Hello $1"
}

greet Bala
greet Arun
```

Benefits:

* Reduces repetition
* Improves readability
* Makes large scripts maintainable

Functions are standard in production-level scripts.

---

# 🟢 Level 5 — File Validation & Checks

Before processing a file, scripts must verify its existence.

## File Existence Check

```bash
if [ -f "test.txt" ]
then
    echo "File exists"
else
    echo "File not found"
fi
```

## Important File Test Flags

| Flag | Meaning          |
| ---- | ---------------- |
| `-f` | File exists      |
| `-d` | Directory exists |
| `-r` | Readable         |
| `-w` | Writable         |
| `-x` | Executable       |
| `-e` | Exists           |

File validation is essential in automation, log processing, and administrative scripts.

---

# 🔹 Example: Professional File Check Script Structure

```bash
#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Usage: ./file_check.sh filename"
    exit 1
fi

filename="$1"

if [ -f "$filename" ]
then
    echo "File exists"
    wc -l "$filename"
else
    echo "File not found"
fi
```

### Concepts Applied

* Argument validation using `$#`
* Accessing argument via `$1`
* File existence test using `-f`
* Line count using `wc -l`
* Basic exit handling

---

# 🎯 Skills Strengthened in This Phase

* Passing arguments to scripts
* Validating user input
* Automating repetitive tasks
* Structuring scripts with functions
* Implementing file safety checks

---

# 🚀 Next Learning Direction

Upcoming areas of focus:

* While loops
* Case-based menu systems
* Exit status mastery
* Input validation techniques
* Text processing (`grep`, `awk`, `sed`)
* Building real automation utilities

---

# 📌 Summary

This phase transitions from beginner Bash usage to structured scripting practices used in real-world environments.

The focus remains on clarity, correctness, and building strong foundational automation skills.

**Author:** Bala
**Focus:** Linux • Bash • Automation • Cybersecurity Foundations
