#!/usr/bin/bash

# Function to calculate memory usage
get_memory_usage() {
    # Read memory info from /proc/meminfo
    mem_total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    mem_available=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
    
    # Calculate used memory
    mem_used=$((mem_total - mem_available))
    
    # Calculate memory usage percentage
    mem_usage=$((100 * mem_used / mem_total))
    
    # Output the memory usage percentage
    echo " ${mem_usage}  "
}

# Calculate memory usage periodically
while true; do
    get_memory_usage
    sleep 1  # Update every second
done