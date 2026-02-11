---
# 📘 Chapter 3: Using the Shell

---

## 1. Introduction

The **shell** is the command-line interface (CLI) of Linux. It is a **program that accepts user commands**, interprets them, and communicates with the **Linux kernel** to perform actions.

### Key Components

- **Terminal**: The window or application where commands are typed
- **Shell**: The command interpreter (e.g., `bash`, `zsh`)
- **Prompt**: The line waiting for user input

### What the Shell Allows You to Do

- Navigate the filesystem
- Run programs and commands
- Automate tasks using scripts
- Control and monitor the system

> Mastering the shell is essential for effective Linux usage and administration.

---

## 2. Types of Shells

| Shell  | Description                | Notes                                  |
|------|----------------------------|----------------------------------------|
| bash | Bourne Again Shell         | Default on many Linux distributions    |
| zsh  | Z Shell                    | Advanced features, powerful completion |
| sh   | Bourne Shell               | Oldest shell, script compatibility     |
| fish | Friendly Interactive Shell | User-friendly, modern interface        |

### Check Current Shell

```bash
echo $SHELL
````

Example output:

```
/bin/zsh
```

This indicates the **active shell** in use.

---

## 3. The Command Prompt

A standard Linux prompt looks like:

```
username@hostname:~$
```

### Prompt Breakdown

* `username` → Logged-in user
* `hostname` → System name
* `~` → Home directory (`/home/username`)
* `$` → Normal user (`#` indicates root)

### Example

```bash
pwd
```

Output:

```
/home/dhoomslizer37
```

This confirms the **current working directory**.

---

## 4. Executing Commands

### Command Syntax

```
command [options] [arguments]
```

### Example 1: List Files

```bash
ls
```

Output:

```
Documents  Downloads  Music
```

### Example 2: Detailed Listing

```bash
ls -l
```

Output:

```
drwxr-xr-x 2 dhoomslizer37 dhoomslizer37 4096 Documents
```

### Output Explanation

* `d` → Directory
* `rwx` → Owner permissions
* `r-x` → Group permissions
* `r-x` → Others permissions
* `4096` → Size in bytes
* `Documents` → Directory name

---

## 5. Command History

Linux shells store previously executed commands.

### View Command History

```bash
history
```

### Re-run Last Command

```bash
!!
```

### Interactive Search

Press:

```
Ctrl + r
```

Type part of a command and press **Enter** to execute.

**Best practice**: Use history to save time and reduce typing errors.

---

## 6. Getting Help

### Manual Pages

```bash
man ls
```

* Displays full command documentation
* Navigate with arrow keys
* Exit using `q`

### Quick Help

```bash
ls --help
```

Provides a summary of usage and options.

> Always consult `man` pages before using unfamiliar commands.

---

## 7. Command Autocompletion (TAB)

Press **TAB** to auto-complete commands and paths.

### Example

```bash
ls /et
```

Press `TAB` → auto-completes to:

```
/etc
```

Works for:

* Commands
* Files
* Directories

---

## 8. Running Multiple Commands

Execute multiple commands on one line using `;`

```bash
pwd; ls; whoami
```

Commands run **sequentially**, from left to right.

---

## 9. Wildcards

Wildcards match patterns in filenames.

| Wildcard | Meaning                | Example           |
| -------- | ---------------------- | ----------------- |
| `*`      | Any characters         | `ls *.txt`        |
| `?`      | Single character       | `ls file?.txt`    |
| `[ ]`    | One character from set | `ls file[12].txt` |

---

## 10. Quoting

Quoting controls how the shell interprets characters.

### Single Quotes `' '`

```bash
echo 'Hello $USER'
```

Output:

```
Hello $USER
```

### Double Quotes `" "`

```bash
echo "Hello $USER"
```

Output:

```
Hello dhoomslizer37
```

### Escape Character `\`

```bash
echo Hello\ World
```

Output:

```
Hello World
```

---

## 11. Environment Variables

Environment variables store system values.

### List All Variables

```bash
printenv
```

### Common Variable Example

```bash
echo $HOME
```

Output:

```
/home/dhoomslizer37
```

Used extensively in scripting and system configuration.

---

## 12. Command Substitution

Store command output inside a variable.

```bash
CURRENT_DIR=$(pwd)
echo $CURRENT_DIR
```

Output:

```
/home/dhoomslizer37
```

Useful for automation and scripting.

---

## 13. Summary and Best Practices

* Always verify your location using `pwd`
* Use **TAB completion** to avoid mistakes
* Read documentation using `man`
* Reuse commands via history
* Understand quoting and wildcards
* Learn environment variables early

> Mastery of the shell builds the foundation for advanced Linux topics.

---

## ✅ Practical Exercises

1. Check active shell:

```bash
echo $SHELL
```

2. Show current directory:

```bash
pwd
```

3. List all files with details:

```bash
ls -al
```

4. Use wildcard search:

```bash
ls *.txt
```

5. Store directory in variable:

```bash
DIR=$(pwd)
echo $DIR
```

6. Run multiple commands:

```bash
pwd; ls; whoami
```

---

