# 🐧 Bash Scripting Mastery — Level 9: Logging & Timestamps (Real CLI Behavior)

This level upgrades scripting from a simple interactive tool to a **real-world CLI-style utility** by introducing logging, timestamps, and structured activity tracking.

Professional command-line tools do not just execute tasks — they also:

* Record activity
* Maintain execution history
* Provide traceability
* Store logs for debugging and auditing

---

# 📁 Why Logging Matters

Logging allows scripts to:

* Track user actions
* Store calculation history
* Help in debugging issues
* Maintain operational records
* Simulate real production-grade tool behavior

Example log entry:

```
[2026-03-03 19:52:11] 10 + 5 = 15
```

Saved inside:

```
calculator.log
```

---

# 🧠 Core Concepts Introduced

## 🔹 `date` Command Formatting

Used to generate timestamps in a structured format.

Example:

```bash
date "+%Y-%m-%d %H:%M:%S"
```

Format breakdown:

* `%Y` → Year
* `%m` → Month
* `%d` → Day
* `%H` → Hour (24-hour format)
* `%M` → Minutes
* `%S` → Seconds

---

## 🔹 Appending to Files

```bash
>> filename
```

* Creates file if it does not exist
* Appends content if file exists
* Prevents overwriting existing logs

---

# 🔥 Logging Function Implementation

```bash
log_operation() {
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $1" >> calculator.log
}
```

### Explanation

* `$1` → Message passed into function
* `timestamp` → Captured from `date`
* `>>` → Appends structured log entry

---

# 🔥 Professional Calculator with Logging

```bash
#!/bin/bash

LOG_FILE="calculator.log"

add() { echo $(( $1 + $2 )); }
subtract() { echo $(( $1 - $2 )); }
multiply() { echo $(( $1 * $2 )); }

divide() {
    if [ "$2" -eq 0 ]
    then
        echo "Error: Division by zero"
    else
        echo $(( $1 / $2 ))
    fi
}

modulus() { echo $(( $1 % $2 )); }

log_operation() {
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $1" >> "$LOG_FILE"
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

    # Input validation
    if ! [[ "$num1" =~ ^[0-9]+$ && "$num2" =~ ^[0-9]+$ ]]
    then
        echo "Invalid number input"
        echo ""
        continue
    fi

    case "$ch" in
        +) result=$(add "$num1" "$num2") ;;
        -) result=$(subtract "$num1" "$num2") ;;
        x) result=$(multiply "$num1" "$num2") ;;
        /) result=$(divide "$num1" "$num2") ;;
        %) result=$(modulus "$num1" "$num2") ;;
        *) echo "Invalid operator"; continue ;;
    esac

    echo "Result: $result"

    if [[ "$result" != Error* ]]
    then
        log_operation "$num1 $ch $num2 = $result"
    fi

    echo ""
done
```

---

# 🧠 What This Script Achieves

* Modular arithmetic functions
* Continuous execution using `while`
* Exit control using `break`
* Input validation using regex
* Error handling for division by zero
* Structured logging with timestamps
* Persistent activity tracking

---

# 📂 Log File Behavior

When running calculations, entries are appended to:

```
calculator.log
```

To view history:

```bash
cat calculator.log
```

If the file does not exist, Bash automatically creates it.

---

# 🚀 Skill Level Upgrade

With logging implemented, the script now demonstrates:

* Real CLI application behavior
* Operational traceability
* Basic auditing capability
* Structured output design
* Intermediate-level shell scripting practices

---

# 📈 Learning Progression So Far

You now understand:

* Variables & Input Handling
* Conditional Statements
* Argument Passing
* Loops (`for`, `while`)
* `case` Statement
* Functions & Modular Programming
* Input Validation
* Logging & Timestamped Activity Tracking

---

🔐 *Next Phase: Log Rotation, Argument-Based Mode, Colored Output, or Advanced Bash Concepts (Arrays, Traps, Signals).*
