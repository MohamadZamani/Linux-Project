# Lab 01: Non-Interactive Secure Web Archive & Remote Transport Pipeline

## 📋 The Mission
The goal of this project was to automate the backup and offsite transmission of web content from application server `stapp03` (`/var/www/html/news`) to a dedicated storage server (`ststor01`) inside the `/archives/` directory.

### Constraints & Requirements:
* **Target Node:** Application Server `stapp03` (User: `banner`).
* **Storage Node:** Storage Server `ststor01` (User: `natasha`).
* **Source & Archive:** Compress `/var/www/html/news` into `xfusioncorp_news.zip`.
* **Zero-Sudo Execution:** The archive script must execute continuously without prompting for interactive passwords or administrative intervention.

---

## 🛠️ My Solution

1. **Package Integrity Check:** Verified system dependencies on `stapp03` to ensure `zip` utility support.
2. **Directory Access Controls:** Fixed local directory ownership (`/scripts` and `/archives`) to user `banner:banner`.
3. **Passwordless Trust Establishment:** Generated a 3072-bit RSA key pair on `stapp03` and provisioned the public key onto `ststor01` (`natasha@ststor01`) via `ssh-copy-id`.
4. **Script Automation:** Authored `news_archive.sh` to package web data locally and instantly transmit the resulting bundle over SSH (`scp`).

---

## 📂 Script Architecture (`news_archive.sh`)

```bash
#!/bin/bash

# Define variables
SOURCE_DIR="/var/www/html/news"
ARCHIVE_NAME="xfusioncorp_news.zip"
LOCAL_DEST="/archives"
REMOTE_USER="natasha"
REMOTE_HOST="ststor01"
REMOTE_DEST="/archives"

# Conditional Execution: Execute SCP ONLY if the zip creation succeeds
zip -r "${LOCAL_DEST}/${ARCHIVE_NAME}" "${SOURCE_DIR}" && \
scp "${LOCAL_DEST}/${ARCHIVE_NAME}" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DEST}/"
