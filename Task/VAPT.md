# 🔐 Structured VAPT Lab – Defensive Security Learning Project

## 📌 Overview

This project documents my hands-on experience conducting a structured Vulnerability Assessment and Penetration Testing (VAPT) exercise within a fully isolated and authorized lab environment.

The objective was to understand attack surface analysis, vulnerability validation, detection behavior, and defensive security mechanisms — strictly for educational and ethical purposes.

<br>

![ALL](https://github.com/Bala3699/kali-linux/blob/main/Task/vapt%20_img/Screenshot%20From%202026-03-02%2017-39-35.png)


<br> 

> ⚠️ All activities were performed in a controlled lab setup. No production systems or real-world targets were involved. 

---

## 🎯 Objectives

- Perform structured reconnaissance
- Identify exposed services and misconfigurations
- Test common web application vulnerabilities
- Validate findings and eliminate false positives
- Observe defensive monitoring and alerting behavior
- Strengthen analytical security mindset

---

## 🧭 Methodology Followed

### 1️⃣ Reconnaissance & Enumeration

- Port scanning
- Service detection
- Version identification

**Goal:** Understand exposed attack surface before testing.

<br>

![nmap](https://github.com/Bala3699/kali-linux/blob/main/Task/vapt%20_img/nmap.png)
![nik](https://github.com/Bala3699/kali-linux/blob/main/Task/vapt%20_img/nik2.jpeg) 
![nik](https://github.com/Bala3699/kali-linux/blob/main/Task/vapt%20_img/nikto.png)

---

### 2️⃣ Web Server & Application Assessment

- Server configuration review
- Directory enumeration
- Header inspection
- Input field testing

**Goal:** Identify common misconfigurations and insecure implementations.

<br>

![what](https://github.com/Bala3699/kali-linux/blob/main/Task/vapt%20_img/what.jpeg)

---

### 3️⃣ Vulnerability Testing (Controlled)

Tested for:

- SQL Injection
- IDOR (Insecure Direct Object Reference)
- Authentication weaknesses
- Brute-force behavior

**Important Observation:**
Several attempts did not succeed due to proper input validation and security controls — reinforcing the importance of secure coding and layered defense.

<br>

![zap](https://github.com/Bala3699/kali-linux/blob/main/Task/vapt%20_img/zap.jpeg)
![zap](https://github.com/Bala3699/kali-linux/blob/main/Task/vapt%20_img/zap2.jpeg)
![sql](https://github.com/Bala3699/kali-linux/blob/main/Task/vapt%20_img/sqlm.jpeg)
![bru](https://github.com/Bala3699/kali-linux/blob/main/Task/vapt%20_img/bru.jpeg)

---

### 4️⃣ Traffic Monitoring & Analysis

- Captured and analyzed network traffic
- Observed request-response patterns
- Monitored alert generation during abnormal activity simulations

**Learning Outcome:**  
Detection systems respond based on behavioral thresholds and traffic characteristics, not just attack attempts.

<br>

![HIOC](https://github.com/Bala3699/kali-linux/blob/main/Task/vapt%20_img/Screenshot%20From%202026-03-02%2017-37-33.png)
![wir](https://github.com/Bala3699/kali-linux/blob/main/Task/vapt%20_img/wir.jpeg)

<br>

![monit](https://github.com/Bala3699/kali-linux/blob/main/Task/vapt%20_img/alert.jpeg)

---

## 🛠 Tools Used

- Nmap
- whatweb
- Nikto
- OWASP ZAP
- sqlmap
- Wireshark
- Brute-force testing utilities
- High orbit cannon
- Lab monitoring & alerting systems

> Tools were used for controlled testing and validation only.

---

## 📊 Key Learning Outcomes

- Methodology is more important than tools
- Not every scan result is a vulnerability
- False positives require validation
- Secure input handling prevents injection attacks
- Defensive monitoring plays a critical role
- Ethical boundaries are non-negotiable in cybersecurity

---

## 🧠 Skills Strengthened

- Attack surface analysis
- Vulnerability validation
- Analytical thinking
- Traffic inspection
- Understanding detection logic
- Ethical security practices

---

## ⚖️ Ethical Considerations

This project was conducted strictly in:

- A private lab environment
- With proper authorization
- For educational and defensive purposes

Cybersecurity is about strengthening systems — not exploiting them.

---

## 🚀 Future Improvements

- Deeper analysis of detection evasion techniques (in lab only)
- Logging analysis integration
- Threat modeling exercises
- Secure architecture review practices

---

## 📌 Conclusion

This structured VAPT lab experience helped me transition from simply using security tools to understanding security methodology and defensive strategy.

Security is not about breaking systems.  
It is about understanding risk and reducing it responsibly.

---

### 👨‍💻 Author

Bala Murugan  
Cybersecurity Enthusiast | VAPT Learner | Defensive Security Focused
