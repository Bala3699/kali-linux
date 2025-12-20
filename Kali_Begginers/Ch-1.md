# `>_` Linux CLI - Shells Bells



This document explains **how comments work in Linux shell (Bash)** with clear examples and best practices. You can include this file in any GitHub repository to help beginners understand shell scripting comments.

---
## To print 
```
echo "Hellow World"
```
## To list the content in the current directory
```
ls
```
## To display the content in the file 
```
cat Reat.txt
```
## To swetch-to current directory
```
cd
```
## There are some file can be `'Hidden'` and this can be find using
```
ls -la
```
> “`-a`flag shows the hidden files, `l` flag shows the additional details, such as file permissions and file owner.”
## To Read the `'Hidden-File'`
Don't forget to add the Leading dot`.`
```
cat .hidden.txt
```
## TO view the log in linux
```
cd /var/log/
```
## To '`search`' or look for the `'specific-text`'
```
grep "pass-lg" hidden.txt
```
## To search for `'Files`' with '`Specific-Parametes`'
>`'-find'` For searching files and `'-name`' for parameter's
```
finde /home/dark/word-list -name*rock-you* 
```
## Single-Line Comments

Anything written after `#` is treated as a comment.

```bash
# This is a single-line comment
echo "Hello World"  # This prints output to the terminal
```

---

## Inline Comments

Comments can be written **after a command on the same line**.

```bash
echo "Starting backup"  # Inform user about backup process
```

---

## Shebang (#!) – Special Comment

The **shebang** is the first line of a script and tells the system which interpreter to use.

```bash
#!/bin/bash
```

Common shebangs:

* `#!/bin/bash` → Bash shell
* `#!/bin/sh` → POSIX shell
* `#!/usr/bin/env bash` → Portable Bash

Although it starts with `#`, it is **not a normal comment**.

---

## Multi-Line Comments (Workarounds)

Linux shell does **not support true multi-line comments**, but there are common workarounds.

### Method 1: Using `#` on each line

```bash
# This is a multi-line comment
# explaining the script
# step by step
```

### Method 2: Using `: << 'COMMENT'` (Here Document)

```bash
: << 'COMMENT'
This is a multi-line comment
It will be ignored by the shell
Useful for documentation
COMMENT
```

---

## Commenting Out Code (Debugging)

Comments are often used to **disable commands temporarily**.

```bash
# rm -rf /important_directory
```

This helps prevent accidental execution during testing.

---

## Best Practices for Shell Comments

✔ Write comments for complex logic
✔ Explain *why* something is done, not just *what*
✔ Keep comments short and clear
✔ Update comments when code changes
✔ Avoid obvious comments

❌ Bad example:

```bash
i=0  # set i to zero
```

✔ Good example:

```bash
i=0  # Counter for failed login attempts
```

---

## Example Script with Comments

```bash
#!/bin/bash

# Script Name: backup.sh
# Purpose: Backup home directory
# Author: Your Name

SOURCE="$HOME"
DEST="/backup/home"

# Create backup directory if it doesn't exist
mkdir -p "$DEST"

# Copy files
cp -r "$SOURCE" "$DEST"

# Notify user
echo "Backup completed successfully"
```

---

## Conclusion

Comments are essential for writing **clean, readable, and maintainable shell scripts**. Proper commenting is a key skill for:

* Linux system administrators
* DevOps engineers
* Cybersecurity professionals

---

⭐ *If you found this helpful, give the repository a star!*
