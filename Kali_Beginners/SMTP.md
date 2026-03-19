# 📧 SMTP Security Analysis (Real-World Observation)

## 📌 Introduction

This document explains a real-world SMTP interaction and why a manually sent email was rejected by a mail server.

The goal is to understand:

- How SMTP works internally
- How modern email security prevents spoofing
- Why unauthenticated emails are blocked

---

## 🔍 SMTP Communication Breakdown

A manual connection was established with a mail server:

```

smtp.google.com (mx.google.com)

```

During this interaction, the following SMTP commands were executed:

- **EHLO** → Introduce the client to the server
- **MAIL FROM** → Specify the sender address
- **RCPT TO** → Specify the recipient address
- **DATA** → Send the email content

This sequence represents how emails are transmitted at the protocol level.

---

## ❗ Email Rejection Error

The server responded with:

```

550-5.7.26 Your email has been blocked because the sender is unauthenticated

```

---

## 🔐 Root Cause Analysis

The email was rejected due to failed authentication mechanisms.

### Key Failures

- **SPF (Sender Policy Framework)** → ❌ Failed  
- **DKIM (DomainKeys Identified Mail)** → ❌ Failed  

---

## 🧠 What This Means

The sender address used was:

```

[bm20052262@gmail.com](mailto:bm20052262@gmail.com)

```

However:

- The email was not sent from an authorized Gmail server
- The sending IP address did not match Gmail's allowed servers

👉 The mail server detected this as an unauthorized attempt.

---

## 🛡️ Core Security Concept

### Email Spoofing Prevention

Modern mail systems prevent spoofing using:

| Mechanism | Purpose                    |
|----------|----------------------------|
| SPF      | Validates sender IP        |
| DKIM     | Verifies message integrity |
| DMARC    | Enforces security policy   |

---

## ⚠️ Historical Context

In earlier implementations of SMTP:

- No authentication was required
- Any user could send email as any address

This led to attacks such as:

- Phishing
- Email spoofing
- Fake identity attacks

---

## 🔥 Why the Attack Failed

The mail server successfully blocked the email because:

- It is **not an open relay**
- It requires proper authentication
- It enforces SPF and DKIM validation

---

## 🧠 Attacker Perspective

If a mail server does not enforce authentication:

👉 An attacker can send emails like:

```

FROM: [ceo@company.com](mailto:ceo@company.com)

```

Without actually owning that account.

This vulnerability is known as:

```

SMTP Open Relay / Email Spoofing

```

---

## 👍 Key Achievements

This exercise demonstrates:

- Successful SMTP connection
- Manual execution of SMTP commands
- Understanding of server responses
- Identification of security controls

---

## 🚀 Key Takeaways

- SMTP is the protocol used to send emails
- By default, SMTP trusts sender input
- Modern systems use SPF, DKIM, and DMARC for validation
- Unauthorized email attempts are blocked by secure servers
- Misconfigured servers can still be exploited

---

## 🔚 Conclusion

This experiment highlights the importance of email security mechanisms in preventing spoofing and unauthorized communication. Understanding SMTP at this level is essential for both system administrators and cybersecurity professionals.
