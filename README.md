# Linux Systems Administration & Automation Portfolio

Welcome to my central repository for enterprise Linux administration, automation, and systems engineering projects. This space serves as a live engineering log where I document real-world systems challenges, scripting solutions, and backend infrastructure workflows.

## 🛠️ Core Skills & Technologies Demonstrated
* **Operating Systems:** RHEL/CentOS stream (DNF/YUM), Ubuntu/Debian ecosystem (APT)
* **Web & Traffic Engineering:** Nginx reverse proxy configuration, upstream weighted load balancing, virtual host management
* **Scripting & Automation:** Advanced Bash/Shell scripting, task scheduling (cron), deployment safety wrappers
* **Access & Security:** SSH key lifecycle management, Linux Permissions (`chmod`/`chown`), POSIX ACLs, User/Group administration
* **Version Control:** Git workflow integration (branching, tracking, commits)

---

## 📂 Project Catalog

1. **[01-Web-Archive-Automation](./01-Web-Archive-Automation/)**
   * **Focus:** Non-interactive secure copy pipeline, automated compression (`zip`), and cryptographic RSA trust validation between application and storage nodes.
   
2. **[02-Nginx-Load-Balancer](./02-Nginx-Load-Balancer/)**
   * **Focus:** Weighted Nginx upstream load balancer scaling (`weight=3`), virtual host de-confliction, and an automated deployment safety wrapper script (`deploy_lb.sh`) with pre-flight syntax checks (`nginx -t`).

---

## 📈 Objective
This repository tracks my hands-on progression as I bridge deep Linux systems administration mechanics into production Cloud Architecture (AWS/Azure) and DevOps environments.
