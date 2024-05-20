from libqtile import widget

# Function to get battery percentage and charger status
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

