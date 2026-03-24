
# 📡 SNMP Fundamentals & Enumeration (VAPT Perspective)

## 📌 Overview

This document explains the fundamentals of SNMP (Simple Network Management Protocol) and its importance in cybersecurity and VAPT.

It covers:

- What SNMP is and how it works
- Core components of SNMP
- SNMP versions and security
- Community strings
- Practical lab setup
- Why SNMP is a target in penetration testing

---

## 🔍 What is SNMP?

SNMP stands for:

```

Simple Network Management Protocol

```

It is used to:

👉 Monitor and manage network devices remotely

---

## 🌐 Real-World Concept

In a large organization, there are many devices:

- Routers
- Switches
- Servers
- Printers

Instead of checking each device manually, administrators use SNMP to monitor everything from a central system.

---

## ⚙️ How SNMP Works

SNMP operates using three main components:

### 1️⃣ Manager

- The system that sends requests
- Example: Kali Linux machine (attacker or admin)

---

### 2️⃣ Agent

- Software running on the target device
- Responds to SNMP queries

---

### 3️⃣ MIB (Management Information Base)

- Database of device information

### Example Data

- CPU usage
- RAM usage
- Running processes
- Network interfaces

---

## 🔄 SNMP Communication Flow

```

Manager → Query → Agent → Response

```

---

## 🔐 SNMP Versions

| Version | Security Description                  |
|--------|--------------------------------------|
| SNMPv1 | ❌ No authentication or encryption    |
| SNMPv2 | ❌ Weak security                      |
| SNMPv3 | ✅ Secure (auth + encryption)         |

---

## 🔑 Community Strings

SNMP uses a simple authentication mechanism called **community strings**.

### Common Values

```

public   → Read-only access
private  → Read-write access

```

---

## ⚠️ Security Risk

If a system uses default community strings like:

```

public

````

👉 Anyone can query the system and extract sensitive information.

---

## 🧪 Hands-On Lab (Kali Linux)

### Step 1 — Install SNMP

```bash
sudo apt install snmp snmpd -y
````

---

### Step 2 — Start SNMP Service

```bash
sudo systemctl start snmpd
```

---

### Step 3 — Test SNMP

```bash
snmpwalk -v1 -c public localhost
```

---

## 🔍 Command Breakdown

* `-v1` → SNMP version 1
* `-c public` → community string
* `localhost` → target system

---

## 📊 Expected Output

You will see output like:

```
iso.3.6.1.2.1.1.1.0 = STRING: Linux ...
```

👉 This means system information is being retrieved successfully.

---

## 🔥 Why SNMP is Important in VAPT

SNMP can expose critical information such as:

* System details
* Running processes
* Network interfaces
* Configuration data

---

## 🚨 Security Risks

Misconfigured SNMP can lead to:

* Information disclosure
* Network mapping
* Reconnaissance for further attacks

---

## 🧠 Key Takeaways

* SNMP is used for network monitoring
* SNMPv1 and v2 are insecure
* Community strings act like passwords
* Default strings like "public" are dangerous
* SNMP is a common target in penetration testing

---

## 🔚 Conclusion

SNMP is a powerful protocol for network management but can become a major security risk if misconfigured. Understanding SNMP is essential for both system administrators and cybersecurity professionals, especially in VAPT engagements.
