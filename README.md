# Automated Linux Backup to Azure Blob Storage

This project demonstrates two complementary backup strategies on Azure:

- **Cron‑based backup (file‑level, script‑driven)**
- **Azure Backup (full VM, infrastructure‑level)**

Together, they form a complete and reliable backup strategy for Linux systems running in the cloud.

---

## 🚀 Project Overview

This repository contains:

- `backup.sh` — Compresses selected directories and uploads them to Azure Blob Storage  
- `restore.sh` — Lists available backups, downloads the selected version, and restores it  
- `crontab.txt` — Cron schedule for automated daily backups  
- Architecture diagram  
- Screenshots of the system in action  

The goal is to provide a **simple, automated, and cloud‑integrated backup workflow** suitable for personal use, small teams, or production environments.

---

## 🧩 How It Works

### **1. backup.sh**
- Authenticates to Azure  
- Generates a timestamp  
- Compresses target directories into a ZIP file  
- Uploads the backup to Azure Blob Storage  
- Logs success or failure  

### **2. restore.sh**
- Lists all available backup files in the Blob container  
- Downloads the selected version  
- Extracts the ZIP archive  
- Restores files to the original directory  

### **3. crontab.txt**
Defines the automated backup schedule:

0 1 * * * /usr/local/bin/backup.sh >> /var/log/backup.log 2>&1

This runs the backup every day at **01:00 AM**.

---

## 🏗 Architecture Diagram

The system uses:

- Linux VM  
- Cron scheduler  
- Bash scripts  
- Azure CLI  
- Azure Blob Storage  
- Azure Monitor alerts  
- Email notifications  
- Azure Backup (Recovery Services Vault)  

![Architecture Diagram](docs/architecture-diagram.png)

---

## 📦 Repository Structure
Automated-Linux-Backup-to-Azure-Blob/
├─ backup.sh

├─ restore.sh

├─ crontab.txt

├─ README.md

└─ docs/

├─ architecture-diagram.png

└─ screenshots/





---

## 🔐 Requirements

- Azure CLI installed  
- Storage account + container  
- Linux VM (Ubuntu recommended)  
- Cron enabled  
- `zip` and `unzip` installed  

---

## ▶️ Running the Backup Manually

```bash
sudo  backup.sh

## ▶️ Running the restore Manualy

sudo  restore.sh

