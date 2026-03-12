
# 🤖 Expect Automation — Error Handling (`timeout` and `eof`)

This document explains how **professional Expect scripts handle errors** using the `timeout` and `eof` patterns.

When automating interactive programs such as:

* SSH
* FTP
* Telnet
* Database logins

unexpected situations can occur. Proper error handling ensures that automation scripts **do not hang or fail silently**.

---

# 📌 Why Error Handling is Important

Automation scripts often interact with external systems. These systems may behave unpredictably.

Common problems include:

```
Server not responding
Connection closed
Incorrect credentials
Network failures
```

Without proper error handling, scripts may:

* Wait indefinitely
* Crash unexpectedly
* Fail silently

Expect provides built-in mechanisms to manage these situations.

---

# ⚙️ The `timeout` Pattern

Sometimes the expected output from a program **never appears**.

Example:

```expect
spawn ssh server
expect "password:"
```

If the server never shows the password prompt, the script will **wait forever**.

This creates unreliable automation.

---

## Using `timeout`

Expect allows scripts to define a timeout handler.

Example:

```expect
expect {
    "password:" { send "12345\r" }
    timeout { puts "Server not responding" }
}
```

Explanation:

| Pattern     | Action                                |
| ----------- | ------------------------------------- |
| `password:` | Send password when prompt appears     |
| `timeout`   | Print error if prompt does not appear |

---

## Default Timeout Value

By default, Expect waits:

```
10 seconds
```

If the expected output does not appear within this time, the `timeout` pattern triggers.

---

## Changing the Timeout Value

The timeout duration can be modified using the `set` command.

Example:

```expect
set timeout 20
```

This tells Expect to wait **20 seconds** before triggering a timeout.

---

# ⚙️ The `eof` Pattern

`eof` stands for:

```
End Of File
```

In Expect scripts, it typically means that **the program has terminated or the connection has closed**.

Example situation:

```
Connection closed by remote host
```

If this occurs, Expect can detect it and respond appropriately.

---

## Example Using `eof`

```expect
expect {
    "password:" { send "12345\r" }
    eof { puts "Connection closed by server" }
}
```

Explanation:

| Pattern     | Meaning                               |
| ----------- | ------------------------------------- |
| `password:` | Continue login process                |
| `eof`       | Detect unexpected program termination |

---

# 🧩 Example of a Professional Expect Script

A reliable Expect script often handles multiple outcomes.

Example:

```expect
spawn ssh bala@server

expect {
    "*password*" { send "12345\r" }
    timeout { puts "Server not responding"; exit }
    eof { puts "Connection closed"; exit }
}

interact
```

---

# 🔄 Script Execution Flow

| Step | Action                                               |
| ---- | ---------------------------------------------------- |
| 1    | Start SSH session                                    |
| 2    | Wait for password prompt                             |
| 3    | Send password automatically                          |
| 4    | Detect timeout or connection closure if errors occur |
| 5    | Allow user interaction                               |

The `interact` command transfers control back to the user after automation completes.

---

# 🌍 Real-World Usage

Error handling is essential when automating large-scale infrastructure tasks.

Examples include:

* Logging into hundreds of servers
* Automating router or switch configuration
* Running scripts across multiple systems
* Managing remote services

Proper error handling ensures that scripts:

* Detect failures quickly
* Report meaningful errors
* Avoid hanging processes
* Maintain reliability during automation

---
