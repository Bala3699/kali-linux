
# 📡 SNMP Enumeration & VAPT Workflow

## 📌 Overview

This document explains SNMP from a penetration testing (VAPT) perspective, focusing on:

- SNMP enumeration techniques
- OID understanding (practical approach)
- Tools used by attackers
- Real-world attack workflow

---

## 🔍 What is SNMP?

SNMP (Simple Network Management Protocol) is used to:

👉 Monitor and manage network devices remotely

However, in cybersecurity:

👉 It is often used for **information gathering (enumeration)**

---

## 🧠 What is an OID?

OID (Object Identifier) is:

👉 A unique path used to locate specific data in SNMP

### Example

```

1.3.6.1.2.1.1.5 → Hostname

```

👉 Think of it like a file path:

```

/system/hostname

```

---

## 🧩 Important Concept (No Memorization)

Do NOT memorize full OIDs.

Instead, remember:

```

1.3.6.1.2.1 → Base (MIB-2)

````

Then explore using tools.

---

## 🛠️ SNMP Enumeration Tools

### 🔹 snmpwalk

```bash
snmpwalk -v1 -c public target-ip
````

### Features:

* Dumps entire SNMP data
* Raw output
* Useful for deep enumeration

---

### 🔹 snmpcheck

```bash
snmpcheck target-ip -c public
```

### Features:

* Structured output
* Easy to read
* Faster analysis

---

## ⚖️ snmpwalk vs snmpcheck

| Tool      | Output Type | Use Case             |
| --------- | ----------- | -------------------- |
| snmpwalk  | Raw data    | Detailed enumeration |
| snmpcheck | Structured  | Quick analysis       |

---

## 🔐 SNMP Security Issue

If SNMP uses default community string:

```
public
```

👉 Anyone can access data without authentication

---

## 🚨 Information Disclosure Risk

SNMP can expose:

* Operating system details
* Running processes
* Network interfaces
* System uptime
* Configuration data

👉 This is why SNMP is considered an:

```
Information Disclosure Vulnerability
```

---

## 🌐 SNMP Port

SNMP runs on:

```
UDP Port 161
```

---

## 🔍 Detecting SNMP (Nmap)

```bash
nmap -sU -p 161 target-ip
```

---

## 🔥 Real VAPT Workflow

### Step 1 — Scan for SNMP

```bash
nmap -sU -p 161 target-ip
```

---

### Step 2 — Enumerate with snmpwalk

```bash
snmpwalk -v1 -c public target-ip
```

---

### Step 3 — Use snmpcheck

```bash
snmpcheck target-ip -c public
```

---

### Step 4 — Analyze Data

Look for:

* OS version
* Running services
* Users
* Network details

---

### Step 5 — Exploitation

Based on findings:

* Search vulnerabilities
* Target services
* Attempt credential attacks
* Perform lateral movement

---

## 🧠 Attacker Mindset

### ❌ Wrong Approach

```
Memorize everything
```

---

### ✅ Correct Approach

```
Enumerate → Analyze → Exploit
```

---

## 🔄 What If SNMP is Secured?

If `public` does not work:

Try:

* Different community strings
* Brute-force (wordlists)
* Other services (SSH, FTP, HTTP)
* Network scanning (Nmap full scan)

---

## 🚀 Key Takeaways

* SNMP is a powerful enumeration protocol
* OIDs are paths, not something to memorize
* snmpwalk and snmpcheck are essential tools
* Default community strings are dangerous
* SNMP can leak critical system information
* Enumeration is the first step in any attack

---

## 🔚 Conclusion

SNMP plays a major role in network management but becomes a serious security risk when misconfigured. Understanding SNMP enumeration techniques is essential for penetration testers and cybersecurity professionals.

