import re
import subprocess

from libqtile.widget import base

class NumLockIndicator(base.ThreadPoolText):
    """Widget to show the current Num Lock state."""

    defaults = [("update_interval", 0.5, "Update Time in seconds.")]

    def __init__(self, **config):
        base.ThreadPoolText.__init__(self, "", **config)
        self.add_defaults(NumLockIndicator.defaults)

    def get_numlock_status(self):
        """Return the current state of the Num Lock key."""
        try:
            output = self.call_process(["xset", "q"])
        except subprocess.CalledProcessError as err:
            output = err.output
            return ""
        if output.startswith("Keyboard"):
            match = re.search(r"Num\s+Lock:\s*(\w*)", output)
            if match:
                return "nmon" if match.group(1) == "on" else "nmof"
        return ""

    def poll(self):
        """Poll content for the text box."""
        return self.get_numlock_status()
