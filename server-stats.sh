#!/bin/bash

echo "==========================================="
echo "         Gathering Server Stats            "
echo "==========================================="

# Gather CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
echo "CPU Usage: $cpu_usage%"

# Gather system uptime
uptime=$(uptime -p)
echo "System Uptime: $uptime"

# Gather system load average
load_avg=$(cat /proc/loadavg | awk '{print $1, $2, $3}')
echo "Load Average: $load_avg"

# Gather memory usage
memory_stats=$(free -m | awk 'NR==2{printf "Total: %s MB, Used: %s MB, Free: %s MB (%.2f%% used)\n", $2, $3, $4, $3*100/$2}')
echo "Memory Usage: $memory_stats"

# Gather disk usage
disk_usage=$(df -h | awk '$NF=="/"{printf "Total: %s, Used: %s, Free: %s (%.2f%% used)\n", $2, $3, $4, $3*100/$2}')
echo "Disk Usage: $disk_usage"

# Gather top processes by CPU usage
top_processes_cpu=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | tail -n 5)
echo "Top 5 Processes by CPU Usage:"
echo "$top_processes_cpu"

# Gather top processes by memory usage
top_processes_mem=$(ps -eo pid,comm,%mem --sort=-%mem | head -n 6 | tail -n 5)
echo "Top 5 Processes by Memory Usage:"
echo "$top_processes_mem"

# Gather OS version
os_version=$(cat /etc/os-release | grep PRETTY_NAME | cut -d '=' -f2 | tr -d '"')
echo "OS Version: $os_version"

# Gather network statistics
network_stats=$(ifconfig | grep -E 'inet (addr:)?' | awk '{print $2}' | sed 's/addr://')
echo "Network Interfaces and IP Addresses:"
echo "$network_stats"

# Gather logged-in users
logged_in_users=$(who | awk '{print $1, $2, $3, $4}')
echo "Logged-in Users:"
echo "$logged_in_users"

# Gather failed login attempts
failed_logins=$(lastb | head -n 10)
echo "Failed Login Attempts (last 10):"
echo "$failed_logins"

# Display the results
echo "==========================================="
echo "Server Statistics Summary:"
echo "-------------------------------------------"
echo "CPU Usage: $cpu_usage%"
echo "System Uptime: $uptime"
echo "Load Average: $load_avg"
echo "Memory Usage: $memory_stats"
echo "Disk Usage: $disk_usage"
echo "Top 5 Processes by CPU Usage:"
echo "$top_processes_cpu"
echo "Top 5 Processes by Memory Usage:"
echo "$top_processes_mem"
echo "OS Version: $os_version"
echo "Network Interfaces and IP Addresses:"
echo "$network_stats"
echo "Logged-in Users:"
echo "$logged_in_users"
echo "Failed Login Attempts (last 10):"
echo "$failed_logins"
echo "==========================================="
echo "Script completed successfully."
echo "==========================================="