

# 🧠 Linux Memory Management — OOM Killer, `oom_score`, and Process Protection

This document explains how Linux handles **Out Of Memory (OOM)** situations and how administrators can control which processes are likely to be terminated when memory runs out.

Understanding OOM behavior is an important skill for **Linux system administrators, DevOps engineers, and security professionals**.

---

# 📌 What is Out Of Memory (OOM)

An **Out Of Memory (OOM)** condition occurs when the system has no available memory to allocate.

This happens when:

```
RAM is fully used
+
Swap memory is exhausted
```

Example scenario:

```
System RAM = 8GB
Applications using = 9GB
```

When this happens, the Linux kernel must free memory to keep the system operational.

To solve this, Linux activates the **OOM Killer**.

---

# ⚙️ What is the OOM Killer

The **OOM Killer** is part of the Linux kernel.

Its purpose is to recover memory when the system runs out of resources.

Process flow:

```
Detect memory exhaustion
↓
Evaluate running processes
↓
Assign badness score
↓
Kill selected process
↓
Free memory
```

To decide which process should be terminated, the kernel calculates a value known as the **OOM score**.

---

# 📂 Important OOM Files in `/proc`

Linux exposes process information through the **`/proc` virtual filesystem**.

Relevant files include:

```
/proc/<PID>/oom_score
/proc/<PID>/oom_score_adj
/proc/<PID>/status
```

Example:

```
/proc/1234/oom_score
```

These files help administrators understand how the system evaluates processes during memory pressure.

---

# 📊 `oom_score`

The `oom_score` value represents how likely a process is to be killed by the OOM Killer.

Command example:

```bash
cat /proc/<PID>/oom_score
```

Example:

```bash
cat /proc/2345/oom_score
```

Example output:

```
450
```

Interpretation:

```
Higher value → more likely to be killed
Lower value → less likely to be killed
```

Typical range:

```
0    → very safe
1000 → very likely to be killed
```

The kernel calculates this score based on factors such as:

* Memory consumption
* Process priority
* Whether the process belongs to a system user
* OOM score adjustment values

---

# ⚙️ `oom_score_adj`

Administrators can manually influence the OOM decision using `oom_score_adj`.

File location:

```
/proc/<PID>/oom_score_adj
```

View the value:

```bash
cat /proc/<PID>/oom_score_adj
```

Example:

```bash
cat /proc/2345/oom_score_adj
```

Possible range:

```
-1000 → never kill
0     → default behavior
1000  → kill first
```

---

# 🔧 Changing `oom_score_adj`

The value can be modified by writing to the file.

Syntax:

```bash
echo VALUE > /proc/<PID>/oom_score_adj
```

Example:

```bash
echo -500 > /proc/2345/oom_score_adj
```

Meaning:

```
Reduce the likelihood that this process will be killed.
```

Another example:

```bash
echo 500 > /proc/2345/oom_score_adj
```

Meaning:

```
Make this process more likely to be killed first.
```

---

# 🛡 Protecting Critical Processes

To protect a process from being terminated during OOM conditions:

```
oom_score_adj = -1000
```

Command example:

```bash
echo -1000 > /proc/<PID>/oom_score_adj
```

Example:

```bash
echo -1000 > /proc/2000/oom_score_adj
```

This approach is often used for critical services such as:

* Databases
* Core system daemons
* Monitoring agents
* Infrastructure services

---

# ⚠️ Signals Used When Killing Processes

Linux uses **signals** to terminate processes.

Important signals include:

| Signal    | Number | Description          |
| --------- | ------ | -------------------- |
| `SIGTERM` | 15     | Graceful termination |
| `SIGKILL` | 9      | Forceful termination |

Graceful termination example:

```bash
kill -15 PID
```

or

```bash
kill PID
```

Forceful termination example:

```bash
kill -9 PID
```

The **OOM Killer typically uses `SIGKILL`** because memory must be freed immediately.

---

# 📊 Checking System Memory

Administrators monitor memory usage using several commands.

### Check Memory Usage

```bash
free -h
```

Options:

| Option | Meaning               |
| ------ | --------------------- |
| `-h`   | Human-readable format |
| `-m`   | Display in megabytes  |
| `-g`   | Display in gigabytes  |

Example:

```bash
free -h
```

---

### Monitor Running Processes

Tools like `top` or `htop` help monitor memory consumption.

```bash
top
```

or

```bash
htop
```

Install `htop`:

```bash
sudo apt install htop
```

---

# 📜 Detecting OOM Events

When the OOM Killer terminates a process, the kernel logs the event.

Example commands to check logs:

```bash
dmesg | grep -i oom
```

or

```bash
journalctl -k | grep oom
```

Example log output:

```
Out of memory: Kill process 2345 (python)
```

---

# ⚙️ OOM Protection with systemd

Services managed by **systemd** can define their own OOM protection.

Service files are typically located in:

```
/etc/systemd/system/
```

Example configuration:

```
[Service]
ExecStart=/usr/bin/myapp
OOMScoreAdjust=-900
```

After editing a service file:

Reload systemd:

```bash
systemctl daemon-reload
```

Restart the service:

```bash
systemctl restart myservice
```

---

# 🔧 Important systemd Memory Options

| Option           | Description                 |
| ---------------- | --------------------------- |
| `OOMScoreAdjust` | Adjust process OOM priority |
| `MemoryMax`      | Maximum allowed memory      |
| `MemoryHigh`     | Soft memory limit           |

Example:

```
MemoryMax=500M
```

This limits the service to **500 MB of memory**.

---

# 🌍 Real Production Scenario

Example server environment:

```
RAM = 16GB
```

Running services:

```
nginx
mysql
redis
python workers
```

If the Python workers start consuming excessive memory, the OOM Killer might terminate them first.

To protect critical services like MySQL:

```
mysql oom_score_adj = -900
```

This reduces the probability that MySQL will be terminated during memory exhaustion.

---

# 📌 Quick Command Reference

Check OOM score:

```bash
cat /proc/PID/oom_score
```

Check adjustment value:

```bash
cat /proc/PID/oom_score_adj
```

Protect process:

```bash
echo -1000 > /proc/PID/oom_score_adj
```

Check OOM logs:

```bash
dmesg | grep oom
```

Check memory usage:

```bash
free -h
```

---

x administration and system performance troubleshooting**.
