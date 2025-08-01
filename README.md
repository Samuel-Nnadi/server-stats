# server-stats

## Overview
`server-stats` is a Bash script designed to gather and display key statistics about a Linux server. It provides insights into system performance, resource usage, and other useful metrics.

## Features
- **CPU Usage**: Displays the total CPU usage percentage.
- **Memory Usage**: Shows total, used, and free memory, along with the percentage of memory used.
- **Disk Usage**: Reports total, used, and free disk space, including the percentage of disk space used.
- **Top Processes**:
  - Top 5 processes by CPU usage.
  - Top 5 processes by memory usage.
- **Additional Stats**:
  - OS version.
  - System uptime.
  - Load average.
  - Network interfaces and IP addresses.
  - Logged-in users.
  - Last 10 failed login attempts.

## Usage
1. Clone the repository or copy the script to your Linux server.
2. Make the script executable:
   ```bash
   chmod +x server-stats.sh
   ```

## Example Output
```
===========================================
         Gathering Server Stats            
===========================================
CPU Usage: 15.3%
System Uptime: up 2 hours, 15 minutes
Load Average: 0.15 0.10 0.05
Memory Usage: Total: 8000 MB, Used: 4000 MB, Free: 4000 MB (50.00% used)
Disk Usage: Total: 100G, Used: 50G, Free: 50G (50.00% used)
Top 5 Processes by CPU Usage:
  PID COMMAND %CPU
  1234 process1 25.0
  5678 process2 20.0
Top 5 Processes by Memory Usage:
  PID COMMAND %MEM
  9101 process3 15.0
OS Version: Ubuntu 20.04.3 LTS
Network Interfaces and IP Addresses:
  192.168.1.100
Logged-in Users:
  user1 pts/0 2025-08-01 10:00
Failed Login Attempts (last 10):
  ...
===========================================
Script completed successfully.
===========================================
```
