
# 📧 SMTP Security, Enumeration & Attack Techniques (VAPT)

## 📌 Overview

This document covers advanced SMTP concepts from a cybersecurity and VAPT perspective.

It includes:

- SMTP command understanding
- Email authentication concepts
- Enumeration techniques
- Common SMTP attack vectors
- Real-world security implications

---

## 🔍 SMTP Command Deep Dive

### EHLO (Extended Hello)

- Used to **identify the client to the SMTP server**
- Initiates an **Extended SMTP (ESMTP)** session

### Example Response

```

250-STARTTLS
250-SIZE

```

These are server-supported features.

---

### MAIL FROM

- Specifies the **sender email address**

---

### RCPT TO

- Specifies the **recipient email address**

---

### DATA

- Used to send:

```

Email subject + body + headers

````

- Ends with a single dot (`.`)

---

## 🔐 Why SMTP Authentication is Important

Modern SMTP servers enforce authentication to prevent abuse.

### Security Goals

- Prevent spam emails
- Stop spoofing attacks
- Block phishing attempts
- Verify sender identity

---

## 🛡️ Email Security Mechanisms

### SPF (Sender Policy Framework)

- Verifies authorized sending IP addresses

### DKIM (DomainKeys Identified Mail)

- Ensures message integrity using digital signatures

### DMARC

- Applies policy enforcement based on SPF and DKIM

---

## ⚠️ SMTP Misconfiguration Risks

If SMTP is not properly secured:

- Attackers can send emails without authentication
- Identity spoofing becomes possible

---

## 🔥 SMTP Enumeration (User Discovery)

### What is Enumeration?

Process of identifying **valid users/accounts** on a mail server.

---

### 1️⃣ VRFY Command

```bash
VRFY admin
````

### Possible Responses

```
250 User exists
550 User not found
```

👉 Used to discover valid usernames

---

### 2️⃣ RCPT TO Enumeration

```bash
RCPT TO:<user@domain.com>
```

### Responses

```
250 OK → valid user
550 No such user → invalid user
```

👉 Helps attackers identify valid email accounts

---

## 🚨 SMTP Open Relay Attack

### What is Open Relay?

An SMTP server that allows sending emails:

* Without authentication
* To any destination

---

### Attack Example

```
MAIL FROM: attacker@evil.com
RCPT TO: victim@company.com
```

👉 Server accepts and sends the email

---

### Impact

* Spam campaigns
* Phishing attacks
* Email impersonation
* Malware distribution

---

## 🎯 Real-World Attack Scenario

1. Attacker finds SMTP server
2. Tests for open relay
3. Performs enumeration
4. Sends phishing emails

### Example Email

```
From: hr@company.com
Subject: Salary Update
```

👉 Victim trusts email → clicks malicious link

---

## 🧪 Practical Testing (Safe Environment)

### Using swaks

```bash
swaks --to fakeuser@test.com \
      --from attacker@test.com \
      --server smtp.gmail.com
```

### Observe

* SMTP response codes
* Authentication failures
* Server behavior

---

## 🧠 Key Takeaways

* SMTP is inherently trust-based but now secured
* EHLO enables extended SMTP features
* Enumeration can expose valid users
* Open relay is a critical vulnerability
* Authentication mechanisms prevent spoofing

---

## 🔚 Conclusion

SMTP plays a critical role in email communication, but misconfigurations can lead to serious security vulnerabilities. Understanding SMTP at both protocol and attack levels is essential for cybersecurity professionals performing VAPT and network assessments.

