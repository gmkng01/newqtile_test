#!/usr/bin/bash

# Function to calculate CPU usage
get_cpu_usage() {
    # Read the first line of /proc/stat (contains CPU usage info)
    cpu_line=$(head -n 1 /proc/stat)
    
    # Extract the numbers from the line
    cpu_values=($cpu_line)
    
    # Get the total CPU time since boot
    total_time=0
    for value in "${cpu_values[@]:1}"; do
        total_time=$((total_time + value))
    done
    
    # Get the idle CPU time
    idle_time=${cpu_values[4]}
    
    # Calculate the CPU usage since the last check
    diff_idle=$((idle_time - prev_idle))
    diff_total=$((total_time - prev_total))
    usage=$((100 * (diff_total - diff_idle) / diff_total))
    
    # Store the current times for the next calculation
    prev_total=$total_time
    prev_idle=$idle_time
    
    # Output the CPU usage percentage
    echo " ${usage}"
}

# Initialize previous times (first read is 0)
prev_total=0
prev_idle=0

# Calculate initial values to establish a baseline
get_cpu_usage > /dev/null

# Calculate CPU usage periodically
while true; do
    get_cpu_usage
    sleep 1  # Update every second
done
