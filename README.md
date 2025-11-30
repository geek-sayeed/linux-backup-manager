# 🛡️ Systems Reliability Toolkit (Backup & Security)

**This repository demonstrates core System Administration and DevOps automation skills through two critical scripts focused on data integrity and security compliance.**

---

## 1. Data Integrity: `backup_manager.sh`

**Goal:** Provide secure, rapid data recovery and minimize Mean Time to Recovery (MTTR) by automating secure configuration backups.

### ⚙️ Operational Flow
* **Time-Stamped Archiving:** Uses `tar` and `gzip` to create compressed, versioned archives (`.tar.gz`) of application data and configuration files.
* **Post-Backup Validation:** Includes built-in checks (e.g., file size validation) to ensure the generated archive is complete and not corrupt before storage.
* **Optimized Retention:** Manages storage costs by automatically enforcing a configurable cleanup policy, deleting backups older than a set period.

## 2. Security Compliance: `security_audit.sh`

**Goal:** Automate compliance checks against security baselines to enforce least-privilege principles and flag configuration drift.

### 🔎 Audit Focus
* **Privilege Audit:** Scans for and identifies users with UID 0 (root-level) to ensure tight access control.
* **Sudoers Integrity:** Verifies the permissions and configuration integrity of the `/etc/sudoers` file.
* **Permissive Files:** Identifies files and directories with insecure or world-writable permissions that expose the system to risk.
* **Security Package Baseline:** Confirms essential security tools (like firewalls or auditing utilities) are correctly installed.

