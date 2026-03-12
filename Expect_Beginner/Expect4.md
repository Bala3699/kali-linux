# 🤖 Expect Automation Fundamentals (spawn, expect, send)

This document explains the **core commands used in Expect**, a powerful automation tool built on top of **Tcl (Tool Command Language)**.

Expect allows scripts to **interact with programs that normally require manual input**, such as SSH, FTP, and other command-line tools.

---

# 📌 What is Expect?

Expect is an automation tool used to control **interactive command-line programs**.

It can:

* Start programs
* Detect program output
* Send input automatically

This makes it useful for automating tasks like:

* SSH logins
* FTP transfers
* Network device configuration
* Telnet sessions
* Database access
* System administration tasks

Expect scripts are written using **Tcl syntax**.

---

# 🧠 Core Expect Commands

Every Expect script is built around **three fundamental commands**:

```
spawn
expect
send
```

These three commands form the **basic automation workflow**.

---

# 1️⃣ `spawn` — Start a Program

The `spawn` command launches an **interactive program** that Expect will control.

Example:

```expect
spawn ssh server
```

Meaning:

```
Start the SSH client
```

Another example:

```expect
spawn ftp ftp.example.com
```

This starts the FTP client.

Without `spawn`, Expect has **no program to interact with**.

---

# 2️⃣ `expect` — Wait for Output

The `expect` command **waits for specific text to appear** in the program's output.

Example:

```expect
expect "password:"
```

Meaning:

```
Wait until the text "password:" appears
```

Expect continuously monitors the program output until it matches the pattern.

This allows scripts to react to **interactive prompts**.

---

# 3️⃣ `send` — Send Input

The `send` command sends text input to the running program.

Example:

```expect
send "mypassword\r"
```

Meaning:

```
Type mypassword and press Enter
```

The special character:

```
\r
```

represents the **Enter key**.

Without `\r`, the program may not submit the input.

---

# 🔄 Automation Workflow

Expect scripts typically follow this sequence:

```
1. Start program
2. Wait for prompt
3. Send response
```

Example flow:

```
spawn → expect → send
```

This interaction repeats until the task is completed.

---

# 🔧 Example: SSH Automation Script

Example Expect script:

```expect
#!/usr/bin/expect

spawn ssh bala@server

expect "password:"

send "mypassword\r"

expect "$"

send "ls\r"

interact
```

---

# 🧩 Step-by-Step Execution

| Step | Action                   |
| ---- | ------------------------ |
| 1    | Start SSH session        |
| 2    | Wait for password prompt |
| 3    | Send password            |
| 4    | Wait for shell prompt    |
| 5    | Run command (`ls`)       |

The `interact` command allows the user to take control after automation completes.

---

# 🌍 Real-World Usage

System administrators and automation engineers use Expect for tasks such as:

* Automated SSH login
* File transfers using FTP
* Router and switch configuration
* Telnet automation
* Password rotation across servers
* Automated database access

---

# ⚡ Example Use Case

Imagine managing **100 servers**.

Manual approach:

```
ssh server1
ssh server2
ssh server3
...
```

Automated approach using Expect:

```
Script logs into all servers automatically
```

This saves time and reduces manual work.

---


