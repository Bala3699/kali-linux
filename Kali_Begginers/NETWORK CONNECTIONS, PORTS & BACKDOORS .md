# 🐧 LINUX MASTERY

## LESSON 17: NETWORK CONNECTIONS, PORTS & BACKDOORS (BLUE TEAM)

> Files and services tell you **how** persistence happens.
> Network traffic tells you **where the attacker is**.

This lesson focuses on **catching attackers while they are active**.

---

## PART 1️⃣ WHY NETWORK MATTERS (BLUE TEAM VIEW)

Attackers must:

* connect out to command-and-control (C2)
* listen for reverse shells
* exfiltrate data
* maintain live access

📌 **No network = no attacker control**

That is why network monitoring is one of the fastest ways to detect compromise.

---

## PART 2️⃣ BASIC NETWORK CONCEPTS (BEGINNER SAFE)

### 🔹 Port

A **port** is a communication endpoint.

Common examples:

* `22` → SSH
* `80` → HTTP
* `443` → HTTPS

Processes use ports to send and receive data.

---

### 🔹 Connection states

* **LISTEN** → waiting for incoming connections
* **ESTABLISHED** → active communication

🚨 Unexpected **LISTEN** = possible backdoor
🚨 Strange **ESTABLISHED** = possible C2 channel

---

## PART 3️⃣ CORE COMMAND: `ss`

### 🔹 Why `ss`?

* Modern replacement for `netstat`
* Faster and more accurate
* Default on most Linux systems

---

### 🔹 Show all TCP connections

```bash
ss -ant
```

Shows:

* source IP and port
* destination IP and port
* connection state

---

### 🔹 Show connections with process info (CRITICAL)

```bash
ss -pant
```

This reveals:

* PID
* process name
* local and remote ports
* remote IP addresses

📌 This is a **top-tier Blue Team command**.

---

## PART 4️⃣ WHAT BLUE TEAM LOOKS FOR

🚨 Common red flags:

* listening ports above 1024
* services running as root on odd ports
* outbound connections to unknown IPs
* suspicious or random process names

Context matters more than a single indicator.

---

## PART 5️⃣ COMMON BACKDOOR PATTERNS

### 🔹 Reverse shell (attacker connects OUT)

```text
ESTAB 192.168.1.10:4444 → 45.33.x.x
```

Why this is suspicious:

* high, uncommon port
* external IP
* long-lived connection

---

### 🔹 Bind shell (attacker connects IN)

```text
LISTEN 0.0.0.0:5555
```

Why this is suspicious:

* unexpected open port
* listening on all interfaces

---

## PART 6️⃣ MAP PROCESS → NETWORK

### 🔹 Using `lsof`

```bash
lsof -i
```

Shows:

* process name
* PID
* protocol
* port

---

### 🔹 Focus only on listening ports

```bash
lsof -i -P -n | grep LISTEN
```

Options used:

* `-P` → show numeric ports
* `-n` → skip DNS resolution

📌 Faster and clearer during investigations.

---

## PART 7️⃣ CHECK WHICH PROCESS OWNS A PORT

### 🔹 Example

```bash
ss -pant | grep 4444
```

This allows you to map:

> **Port → PID → Process → Binary**

This mapping is essential for containment.

---

## PART 8️⃣ INTRO TO PACKET CAPTURE (OBSERVATION ONLY)

Packet capture lets you **see traffic content**.

---

### 🔹 Capture all traffic (do NOT run blindly)

```bash
tcpdump -i any
```

🚨 Only with authorization and clear scope.

---

### 🔹 Filter traffic by port

```bash
tcpdump -i any port 4444
```

Useful for:

* validating suspicious connections
* confirming C2 traffic

---

## PART 9️⃣ BLUE TEAM INVESTIGATION FLOW
```
1️⃣ Identify active connections
2️⃣ Find listening ports
3️⃣ Map port → process
4️⃣ Identify binary path
5️⃣ Check persistence (cron, systemd)
6️⃣ Escalate findings
```
This flow prevents panic and evidence loss.

---

## PART 🔟 SAFE RULES (VERY IMPORTANT)

❌ Do NOT kill connections immediately
❌ Do NOT block IPs blindly

✔️ Capture command output
✔️ Identify process owner
✔️ Preserve evidence

---

## PART 1️⃣1️⃣ QUICK COMMAND TABLE

| Purpose           | Command        |              |
| ----------------- | -------------- | ------------ |
| View connections  | `ss -ant`      |              |
| With process info | `ss -pant`     |              |
| Listening ports   | `lsof -i -P -n | grep LISTEN` |
| Port owner        | `ss -pant      | grep PORT`   |
| Packet capture    | `tcpdump`      |              |

---

> 🛡️ **If you can map**
> **PORT → PROCESS → FILE → PERSISTENCE**,
> you can dismantle almost any Linux attack.
