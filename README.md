# Linux Systems Administration & Automation Portfolio

Welcome to my central repository for enterprise Linux administration, automation, and systems engineering projects. This space serves as a live engineering log where I document real-world systems challenges, scripting solutions, and backend infrastructure workflows.

## 🛠️ Core Skills & Technologies Demonstrated
* **Operating Systems:** RHEL/CentOS stream (DNF/YUM), Ubuntu/Debian ecosystem (APT)
* **Web & Traffic Engineering:** Nginx reverse proxy configuration, upstream weighted load balancing, virtual host management
* **Networking & High Availability:** Network interface bonding (Active-Backup), Netplan configuration, IP routing
* **Firewall & Security:** IPTables, Port Redirection (DNAT), Source NAT (Masquerading), SSH key lifecycle management
* **Scripting & Automation:** Advanced Bash/Shell scripting, task scheduling (cron), deployment safety wrappers
* **Version Control:** Git workflow integration (branching, tracking, commits)

---

## 📂 Project Catalog

1. **[01-Web-Archive-Automation](./01-Web-Archive-Automation/)**
   * **Focus:** Non-interactive secure copy pipeline, automated compression (`zip`), and cryptographic RSA trust validation between application and storage nodes.
   
2. **[02-Nginx-Load-Balancer](./02-Nginx-Load-Balancer/)**
   * **Focus:** Weighted Nginx upstream load balancer scaling (`weight=3`), virtual host de-confliction, and an automated deployment safety wrapper script (`deploy_lb.sh`) with pre-flight syntax checks (`nginx -t`).

3. **[03-HA-Enterprise-NAT-Gateway](./03-HA-Enterprise-NAT-Gateway/)**
   * **Focus:** Designed a High-Availability edge gateway integrating Layer 2 hardware redundancy (active-backup interface bonding via Netplan) with Layer 4 traffic management (IPTables port redirection and NAT masquerading).

---

## 📈 Objective
This repository tracks my hands-on progression as I bridge deep Linux systems administration mechanics into production Cloud Architecture (AWS/Azure) and DevOps environments.
