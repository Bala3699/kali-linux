# `>_`Ch-2 linux comments

##  `.sh` Shell scripts
Files with the **`.sh`** extension contain CLI commands and are called shell scripts. Such scripts are used both by IT teams to automate things and by attackers to quickly run malicious commands.
```
setup.sh
```
## To list unique items from text
>`'|'` Pipe symbol Send the output from the first command to the second 
```
cat tst.txt | sort | uniq
```
## Output redirect `'(>/>>)'`	Use `'>'` to overwrite a file, and `'>>'` to append to the end
```
cat tst.txt | sort | uniq > /home/dark.txt
```
## To Delete the file
```
rm tst.txt
```
## Replace the original file with another file
> `'&&'` Double ampersand This run's the second command if the first was successful
```
mv ct.txt man.txt && echo "File Moved"
```
## To see how much time your system is running
```
uptime
```      
## To check your ip address
```
ifconfig
```
## To Process all the files
```
psaux
```
## To verify the current User
```
whoami
```
## To swetch to Root user
```
sudo su
```
# To return back to normal user
```
exit
```
## To analyse the Bash History
```
history
```
## Check disk usage in human-readable format 
```
df -h
```
## View running processes live 
```
top
```
What happens:
-  Shows running programs
-  Shows CPU usage
-  Shows memory usage
Think of it as:
>  Linux Task Manager
Columns:
-  PID → process ID
-  USER → who runs it
-  %CPU → CPU usage
-  %MEM → RAM usage
```
q
```
q Exit by pressing  
Why important:
-  Find slow programs
-  Monitor system health
-  Kill misbehaving processes (later)

## See SSH sessions/processes
```
ps aux | grep ssh
```
Each command teaches you how Linux provides real-time visibility into system resources.

## to see see the kernel running on your system.
```
uname -a
```
- uname - print the system information
- -a show available details

Meaning:
- Linux → kernel name
- 5.15.0-70 → kernel version
- x86_64 → 64-bit system
- GNU/Linux → GNU tools + Linux kernel
  
This proves Linux is the kernel, not the whole OS.

## to print working directory
```
pwd
```
## Long listing format
```
ls -l
```
Example output:
```
drwxr-xr-x 2 student student 4096 Documents
```

Breakdown:

-  d → directory
-  rwx → owner permissions
-  r-x → group permissions
-  r-x → others
-  student → owner
-  4096 → size

## Go back
```
cd ..
```
- `..` means one level up

## Command Structure (VERY IMPORTANT)
Every Linux command follows this pattern:
```
command  option(s)  argument(s)
```
Example:
```
ls -l /home
```

- `ls` → command
- `-l` → option (how to run)
- `/home` → argument (on what)

## To hide a file & folder use `"."`
```
.example.txt
```
---

## 1️⃣ `whoami`

### Command
```bash
whoami
````

### Meaning

👉 **Who am I? (current user)**

Internally, Linux checks:

* Which user is logged in
* Prints the username

### Example Output

```text
student
```

### Why This Is Important

* Linux is a **multi-user operating system**
* Every file, process, and permission depends on **who you are**
* Helps confirm which user account you are using

---

## 2️⃣ `pwd`

### Command

```bash
pwd
```

### Meaning

**Print Working Directory**
It shows your **current location** in the filesystem.

### Linux Filesystem Structure (Tree Example)

```text
/
└── home
    └── student
```

### Example Output

```text
/home/student
```

### Meaning of Output

* You are currently inside the `student` user’s home directory
* Everything you do (create files, run commands) happens **here**

---

## 3️⃣ `ls`

### Command

```bash
ls
```

### Meaning

Lists **files and folders** in the current directory.

### Example Output

```text
Documents  Downloads  Music
```

---

### Detailed Listing

```bash
ls -l
```

### Example Output

```text
drwxr-xr-x 2 student student 4096 Documents
```

### Explanation (Do NOT Memorize — Just Understand)

| Part      | Meaning            |
| --------- | ------------------ |
| d         | Directory          |
| rwx       | Owner permissions  |
| r-x       | Group permissions  |
| r-x       | Others permissions |
| student   | File owner         |
| 4096      | File size          |
| Documents | Name               |

📌 Permissions will be covered later — for now, just recognize the format.

---

## 4️⃣ `cd`

### Command

```bash
cd Documents
```

### Meaning

**Change Directory**
Moves you inside the `Documents` folder.

### Verify Location

```bash
pwd
```

---

### Go Back One Level

```bash
cd ..
```

### Explanation

* `..` means **parent directory**
* Used to move **up** in the directory tree

---

## 5️⃣ `uname`

### Basic Command

```bash
uname
```

### Example Output

```text
Linux
```

### Meaning

Shows the **kernel name**

---

### Detailed Information

```bash
uname -a
```

### Example Output

```text
Linux mypc 5.15.0 x86_64 GNU/Linux
```

### Explanation

| Part      | Meaning             |
| --------- | ------------------- |
| Linux     | Kernel name         |
| 5.15.0    | Kernel version      |
| x86_64    | 64-bit architecture |
| GNU/Linux | OS type             |

---

## 6️⃣ `cat`

### Command

```bash
cat /etc/os-release
```

### Meaning

* Reads a file
* Prints its content to the terminal

### Example Output

```text
NAME="Ubuntu"
VERSION="22.04"
```

### Used For

* Reading configuration files
* Viewing text files
* Debugging system settings

---

## 7️⃣ `top` (IMPORTANT)

### Command

```bash
top
```

### What Happens

* Shows **running processes**
* Displays **CPU usage**
* Displays **memory usage**

🧠 Think of it as **Linux Task Manager**

---

### Important Columns

| Column | Meaning          |
| ------ | ---------------- |
| PID    | Process ID       |
| USER   | Owner of process |
| %CPU   | CPU usage        |
| %MEM   | RAM usage        |

### Exit `top`

```text
Press q
```

### Why `top` Is Important

* Identify slow programs
* Monitor system health
* Detect resource-heavy processes
* Kill misbehaving programs (later)

---

# 📁 PART 4: FILESYSTEM — FULLY SIMPLIFIED

## Root Directory

Linux has **ONE root directory**:

```text
/
```

Everything starts from `/`

---

## Important Directories

| Directory | Purpose                |
| --------- | ---------------------- |
| /home     | User files             |
| /etc      | Configuration files    |
| /bin      | Basic system commands  |
| /usr      | Installed software     |
| /var      | Logs and variable data |

---

### Example

```bash
ls /etc
```

### You Will See

* Configuration files
* Service settings
* System behavior controls

⚠️ Be careful — editing wrong files can break the system.

---

# 🧠 PART 5: KERNEL & DISTRIBUTION (DISTRO)

## Kernel

* Core of Linux
* Communicates with hardware
* Manages CPU, memory, devices, processes

🧠 Think of it as the **brain of the OS**

---

## Distribution (Distro)

A **complete operating system** built using:

* Linux kernel
* Commands
* Package manager
* Desktop or server tools

### Popular Distros

* Ubuntu
* Fedora
* RHEL (Red Hat Enterprise Linux)

---
## Conclusion

Comments are essential for writing **clean, readable, and maintainable shell scripts**. Proper commenting is a key skill for:

* Linux system administrators
* DevOps engineers
* Cybersecurity professionals

---

⭐ *If you found this helpful, give the repository a star!*

