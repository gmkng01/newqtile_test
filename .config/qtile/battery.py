#                                                   *** First Code ***

from libqtile import widget

def get_battery_info():

    battery_percentage = open("/sys/class/power_supply/BAT1/capacity").read().strip()

    charger_status = open("/sys/class/power_supply/ACAD/online").read().strip()
    if charger_status == "1":
        charger_status_text = "󰚥"
    else:
        charger_status_text = ""
    
    battery_text = f"{battery_percentage}  {charger_status_text}"
    
    return battery_text

class BatteryWidget(widget.base.ThreadPoolText):
    defaults = [
        ('update_interval', 1, 'Update interval in seconds'),
    ]
    
    def __init__(self, font="Arial", fontsize=12, foreground="ffffff", background="000000", **config):
        super().__init__(text="", **config)
        self.add_defaults(BatteryWidget.defaults)
        self.font = font
        self.fontsize = fontsize
        self.foreground = foreground
        self.background = background

    def poll(self):
        return get_battery_info()

    def tick(self):
        self.update(self.poll())

    def update(self, text):
        self.text = text
        self.bar.draw()


# from libqtile import widget
# import subprocess
# import time

# # Function to get battery percentage and charger status
# def get_battery_info():
#     with open("/sys/class/power_supply/BAT1/capacity") as f:
#         battery_percentage = f.read().strip()
    
#     with open("/sys/class/power_supply/ACAD/online") as f:
#         charger_status = f.read().strip()

#     if charger_status == "1":
#         charger_status_text = "󰚥"
#     else:
#         charger_status_text = ""

#     battery_text = f"{battery_percentage}  {charger_status_text}"
#     return battery_text, int(battery_percentage), charger_status == "1"

# class BatteryWidget(widget.base.ThreadPoolText):
#     defaults = [
#         ('update_interval', 1, 'Update interval in seconds'),
#         ('low_battery_script', '', 'Path to the script to run when battery is low'),
#         ('script_check_interval', 60, 'Interval to check battery status for script in seconds'),
#     ]

#     def __init__(self, font="Arial", fontsize=12, foreground="ffffff", background="000000", **config):
#         super().__init__(text="", **config)
#         self.add_defaults(BatteryWidget.defaults)
#         self.font = font
#         self.fontsize = fontsize
#         self.foreground = foreground
#         self.background = background
#         self.low_battery_script = config.get('low_battery_script', '')
#         self.script_check_interval = config.get('script_check_interval', 60)
#         self.last_script_run_time = 0

#     def poll(self):
#         battery_text, battery_percentage, charger_plugged = get_battery_info()
#         current_time = time.time()

#         if battery_percentage <= 20 and not charger_plugged:
#             if current_time - self.last_script_run_time >= self.script_check_interval:
#                 self.run_low_battery_script()
#                 self.last_script_run_time = current_time
#         elif charger_plugged:
#             self.last_script_run_time = 0  # Reset to allow script run next time battery is low and charger is unplugged

#         return battery_text

#     def run_low_battery_script(self):
#         if self.low_battery_script:
#             try:
#                 subprocess.run([self.low_battery_script], check=True)
#             except subprocess.CalledProcessError as e:
#                 print(f"Error running low battery script: {e}")

#     def tick(self):
#         self.update(self.poll())

#     def update(self, text):
#         self.text = text
#         self.bar.draw()



