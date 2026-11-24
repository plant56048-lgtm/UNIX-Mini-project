# AUTOMATED REPORT GENERATING SYSTEM

# Create report directory
REPORT_DIR="System_Reports"
mkdir -p "$REPORT_DIR"

# Generate date and time
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Create report file
REPORT_FILE="$REPORT_DIR/Report_$DATE.txt"

echo "========================================" > "$REPORT_FILE"
echo "       AUTOMATED SYSTEM REPORT" >> "$REPORT_FILE"
echo "========================================" >> "$REPORT_FILE"

# 1. Date and Time
echo "" >> "$REPORT_FILE"
echo "1. DATE AND TIME" >> "$REPORT_FILE"
date >> "$REPORT_FILE"

# 2. System Information
echo "" >> "$REPORT_FILE"
echo "2. SYSTEM INFORMATION" >> "$REPORT_FILE"
echo "Hostname: $(hostname)" >> "$REPORT_FILE"
echo "Operating System: $(uname -o)" >> "$REPORT_FILE"
echo "Kernel Version: $(uname -r)" >> "$REPORT_FILE"

# 3. CPU Information
echo "" >> "$REPORT_FILE"
echo "3. CPU INFORMATION" >> "$REPORT_FILE"
lscpu | grep -E "Model name|CPU\(s\)" >> "$REPORT_FILE"

# 4. Memory Usage
echo "" >> "$REPORT_FILE"
echo "4. MEMORY USAGE" >> "$REPORT_FILE"
free -h >> "$REPORT_FILE"

# 5. Disk Usage
echo "" >> "$REPORT_FILE"
echo "5. DISK USAGE" >> "$REPORT_FILE"
df -h >> "$REPORT_FILE"

# 6. Logged-in Users
echo "" >> "$REPORT_FILE"
echo "6. LOGGED-IN USERS" >> "$REPORT_FILE"
who >> "$REPORT_FILE"

# 7. Running Processes
echo "" >> "$REPORT_FILE"
echo "7. TOP 10 RUNNING PROCESSES" >> "$REPORT_FILE"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -11 >> "$REPORT_FILE"

# 8. System Uptime
echo "" >> "$REPORT_FILE"
echo "8. SYSTEM UPTIME" >> "$REPORT_FILE"
uptime >> "$REPORT_FILE"

# 9. Network Information
echo "" >> "$REPORT_FILE"
echo "9. NETWORK INFORMATION" >> "$REPORT_FILE"
hostname -I >> "$REPORT_FILE"

# 10. Current User
echo "" >> "$REPORT_FILE"
echo "10. CURRENT USER" >> "$REPORT_FILE"
whoami >> "$REPORT_FILE"

# Report Completion
echo "" >> "$REPORT_FILE"
echo "========================================" >> "$REPORT_FILE"
echo "   REPORT GENERATED SUCCESSFULLY" >> "$REPORT_FILE"
echo "========================================" >> "$REPORT_FILE"

# Display success message
echo ""
echo "========================================"
echo " AUTOMATED REPORT GENERATED SUCCESSFULLY"
echo "========================================"
echo "Report saved at: $REPORT_FILE"
echo ""

# Display generated report
cat "$REPORT_FILE"


