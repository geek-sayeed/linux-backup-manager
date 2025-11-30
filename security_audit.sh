#!/bin/bash
# Security Audit Script (security_audit.sh)

AUDIT_LOG="security_report_$(date +%Y%m%d).log"

echo "--- System Security Audit Report ---" > "$AUDIT_LOG"
echo "Date: $(date)" >> "$AUDIT_LOG"

# Check for root users (UID 0)
echo -e "\n--- Root User Check ---" >> "$AUDIT_LOG"
grep ':0:0:' /etc/passwd >> "$AUDIT_LOG"

# Check for world-writable files in /tmp
echo -e "\n--- World-Writable Files in /tmp ---" >> "$AUDIT_LOG"
find /tmp -type f -perm -o=w >> "$AUDIT_LOG"

echo "Audit Complete. Report saved to $AUDIT_LOG"
