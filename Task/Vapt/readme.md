# 🔐 Conducting a Structured VAPT in a Controlled Lab Environment

## 📌 Overview

As part of my cybersecurity internship, I conducted a structured Vulnerability Assessment and Penetration Testing (VAPT) exercise within a fully isolated and authorized lab environment.

This engagement was performed strictly for educational and defensive purposes. No production systems were involved.

The objective was to understand how layered security controls protect modern web applications.

---

## 🧭 1. Reconnaissance & Attack Surface Mapping

### 🛠 Tools Used
- Nmap – Network enumeration  
- WhatWeb – Technology fingerprinting  

### 🔎 Activities Performed
- Identified exposed services and open ports  
- Fingerprinted web technologies  
- Mapped potential attack surface areas  

### 💡 Key Learning
Proper service configuration significantly reduces unnecessary exposure.

---

## 🖥 2. Web Server & Configuration Assessment

### 🛠 Tool Used
- Nikto – Web server vulnerability scanner  

### 🔍 Areas Reviewed
- Server misconfigurations  
- Outdated components  
- Risky HTTP methods  
- Security header implementation  

### 💡 Key Learning
Many vulnerabilities arise from configuration weaknesses rather than application logic flaws.

---

## 🌐 3. Web Application Security Testing

### 🛠 Tool Used
- OWASP ZAP – Web application security scanner  

### 🔐 Security Areas Assessed
- Input validation mechanisms  
- Authentication workflows  
- Access control logic (IDOR checks)  
- Injection resistance  
- CSRF protections  

### 📊 Observations
- SQL injection attempts were mitigated  
- CSRF token validation prevented automated login abuse  
- No critical high-risk vulnerabilities were identified  

### 💡 Key Learning
Strong input validation and CSRF protections significantly reduce automated attack risks.

---

## 🔑 4. Authentication & Access Control Testing

### 🔍 Areas Tested
- Credential handling  
- Session management  
- Role-based authorization  
- Horizontal privilege validation  

### 💡 Key Learning
Secure authentication requires layered validation and proper session enforcement.

---

## 💥 5. Controlled Availability Testing

### 🎯 Objectives
- Evaluate server stability under abnormal load  
- Observe rate-limiting effectiveness  
- Analyze traffic handling resilience  

### 💡 Key Learning
Availability is a critical component of security and must be tested responsibly.

---

## 📡 6. Network Traffic Analysis

### 🛠 Tool Used
- Wireshark – Network protocol analyzer  

### 📈 Analysis Included
- TCP handshake observation  
- HTTP request/response patterns  
- Response code distribution  
- Traffic behavior during stress simulations  

### 💡 Key Learning
Understanding network behavior strengthens both offensive testing and defensive monitoring.

---

## 🧠 Major Takeaways

- Security is about defense in depth  
- Proper configuration prevents many attacks  
- Not all testing leads to exploitation — secure systems are a success  
- Real VAPT is about structured analysis, not just running tools  

---

## 🎯 Professional Growth

This experience strengthened my understanding of:

- Structured VAPT methodology  
- Attack surface mapping  
- Authentication & access control validation  
- Traffic-level network analysis  
- Responsible disclosure mindset  

### 🚀 Current Focus Areas

- Deep manual testing techniques  
- Business logic flaw analysis  
- Advanced web exploitation concepts  
- Professional vulnerability reporting  

---

## ⚖️ Ethical Statement

All testing was conducted in a controlled, authorized, and isolated lab environment strictly for defensive learning purposes.

---

## 🤝 Connect

Open to connecting with cybersecurity professionals and teams who value ethical security research and continuous learning.
