#!/usr/bin/env python3

import subprocess
from func_var import bk
def is_process_running(process_name):
    try:
        # Run `pgrep` to check if the process is running
        result = subprocess.run(['pgrep', '-x', process_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        return result.returncode == 0
    except Exception as e:
        print(f"Error checking process: {e}")
        return False

def kill_process(process_name):
    try:
        subprocess.run(['killall', process_name], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error killing process: {e}")

def start_trayer():
    try:
        subprocess.Popen([
            'trayer',
            '--transparent', 'true',
            '--width', '6',
            '--edge', 'top',
            '--align', 'right',
            '--alpha', '0',
            '--tint', f'0x{bk[1::]}',
            '--margin', '0',
            '--distance', '0',
            # '--height', '22',
            '--distancefrom', 'top'
        ])
    except Exception as e:
        print(f"Error starting trayer: {e}")

# Main logic
if is_process_running('trayer'):
    kill_process('trayer')

start_trayer()