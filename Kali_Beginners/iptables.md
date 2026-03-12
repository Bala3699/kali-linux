
# 🔥 Linux Firewall Basics — `iptables` Administration Guide

`iptables` is a powerful **Linux firewall utility** used to control network traffic entering, leaving, or passing through a system.

It allows administrators to create rules that **allow, block, or modify network packets** based on criteria such as:

* IP address
* Port number
* Protocol
* Connection state

Understanding `iptables` is a fundamental skill for **Linux system administrators, security engineers, and DevOps professionals**.

---

# 📌 Checking if `iptables` is Installed

Before using the firewall, confirm that `iptables` exists on the system.

```bash
iptables --version
```

Example output:

```
iptables v1.8.x
```

If the command returns a version number, `iptables` is available.

---

# 📋 Viewing Current Firewall Rules

To view the currently configured firewall rules:

```bash
iptables -L
```

Example output:

```
Chain INPUT (policy ACCEPT)
Chain FORWARD (policy ACCEPT)
Chain OUTPUT (policy ACCEPT)
```

---

# 🔗 Understanding Firewall Chains

`iptables` processes packets using predefined **chains**.

| Chain     | Description                        |
| --------- | ---------------------------------- |
| `INPUT`   | Traffic entering the system        |
| `OUTPUT`  | Traffic leaving the system         |
| `FORWARD` | Traffic passing through the system |

Each chain can contain multiple rules that determine how packets are handled.

---

# 🔍 Viewing Detailed Rule Information

Administrators often use a more detailed view of firewall rules.

```bash
iptables -L -v -n
```

Option explanation:

| Flag | Meaning                                        |
| ---- | ---------------------------------------------- |
| `-L` | List rules                                     |
| `-v` | Verbose output                                 |
| `-n` | Display numeric IP addresses (skip DNS lookup) |

This command provides information about:

* Packet counters
* Byte counters
* Protocols
* Source and destination addresses

---

# ⚙️ Default Firewall Policy

The default policy determines what happens to packets **when no rule matches**.

Example:

```
policy ACCEPT
```

Meaning:

```
Allow all traffic unless explicitly blocked
```

Another possible policy:

```
policy DROP
```

Meaning:

```
Block all traffic unless explicitly allowed
```

---

# 🚫 Blocking Ping Requests

To block ICMP echo requests (ping):

```bash
iptables -A INPUT -p icmp -j DROP
```

Explanation:

| Option    | Meaning                        |
| --------- | ------------------------------ |
| `-A`      | Append rule                    |
| `INPUT`   | Apply rule to incoming traffic |
| `-p icmp` | Match ICMP protocol            |
| `-j DROP` | Discard packet                 |

After adding the rule, ping requests to the system will be blocked.

---

# 🔎 Verifying Firewall Rules

To confirm the rule was added:

```bash
iptables -L -v -n
```

Example rule entry:

```
DROP icmp -- anywhere anywhere
```

This indicates ICMP traffic is being dropped.

---

# 🗑 Removing a Firewall Rule

First display rules with line numbers:

```bash
iptables -L --line-numbers
```

Example output:

```
1 DROP icmp -- anywhere anywhere
```

Delete the rule using its number:

```bash
iptables -D INPUT 1
```

This removes rule number 1 from the `INPUT` chain.

---

# 🔓 Allowing a Specific Port

To allow SSH connections on port 22:

```bash
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

Explanation:

| Option       | Meaning             |
| ------------ | ------------------- |
| `-p tcp`     | Match TCP protocol  |
| `--dport 22` | Destination port 22 |
| `-j ACCEPT`  | Allow packet        |

This rule permits SSH traffic to the system.

---

# 🚷 Blocking Traffic from a Specific IP

To block traffic from a specific IP address:

```bash
iptables -A INPUT -s 192.168.1.100 -j DROP
```

Explanation:

| Option | Meaning                          |
| ------ | -------------------------------- |
| `-s`   | Source IP address                |
| `DROP` | Discard packets from this source |

All packets originating from that IP will be blocked.

---

# 🔐 Setting a Secure Default Policy

A common security practice is to block everything by default.

Example:

```bash
iptables -P INPUT DROP
```

Meaning:

```
All incoming traffic is blocked unless explicitly allowed
```

---

# 🔄 Allowing Established Connections

When using restrictive firewall policies, it is important to allow packets from **existing connections**.

```bash
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
```

Explanation:

| Component                       | Meaning                                 |
| ------------------------------- | --------------------------------------- |
| `-m conntrack`                  | Use connection tracking module          |
| `--ctstate ESTABLISHED,RELATED` | Allow responses to existing connections |
| `ACCEPT`                        | Permit traffic                          |

This rule prevents network communication from breaking.

---

# 💾 Saving Firewall Rules

By default, `iptables` rules are **not persistent** and disappear after reboot.

To save current rules:

```bash
iptables-save
```

To restore saved rules:

```bash
iptables-restore
```

Many Linux distributions provide tools or services to persist firewall configurations automatically.

---

# 📊 Summary of Common Commands

List firewall rules:

```bash
iptables -L
```

List rules with details:

```bash
iptables -L -v -n
```

Add a rule:

```bash
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

Delete a rule:

```bash
iptables -D INPUT <rule-number>
```

Set default policy:

```bash
iptables -P INPUT DROP
```

