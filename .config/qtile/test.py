
# import re
# import subprocess

# from libqtile.widget import base



# class CapsNumLockIndicator(base.ThreadPoolText):
#     """Really simple widget to show the current Caps/Num Lock state."""

#     defaults = [("update_interval", 0.5, "Update Time in seconds.")]

#     def __init__(self, **config):
#         base.ThreadPoolText.__init__(self, "", **config)
#         self.add_defaults(CapsNumLockIndicator.defaults)

#     def get_indicators(self):
#         """Return a list with the current state of the keys."""
#         try:
#             output = self.call_process(["xset", "q"])
#         except subprocess.CalledProcessError as err:
#             output = err.output
#             return []
#         if output.startswith("Keyboard"):
#             indicators = re.findall(r"(Caps|Num)\s+Lock:\s*(\w*)", output)
#             return indicators

#     def poll(self):
#         """Poll content for the text box."""
#         indicators = self.get_indicators()
#         status = " ".join([" ".join(indicator) for indicator in indicators])
#         return status


# import re
# import subprocess

# from libqtile.widget import base

# class CapsNumLockIndicator(base.ThreadPoolText):
#     """Really simple widget to show the current Caps/Num Lock state."""

#     defaults = [("update_interval", 0.5, "Update Time in seconds.")]

#     def __init__(self, **config):
#         base.ThreadPoolText.__init__(self, "", **config)
#         self.add_defaults(CapsNumLockIndicator.defaults)

#     def get_indicators(self):
#         """Return a dictionary with the current state of the keys."""
#         try:
#             output = self.call_process(["xset", "q"])
#         except subprocess.CalledProcessError as err:
#             output = err.output
#             return {}

#         indicators = {}
#         if output.startswith("Keyboard"):
#             matches = re.findall(r"(Caps|Num)\s+Lock:\s*(\w*)", output)
#             for match in matches:
#                 if match[0] == "Caps":
#                     indicators["Caps"] = "cpon" if match[1] == "on" else "cpof"
#                 elif match[0] == "Num":
#                     indicators["Num"] = "nmon" if match[1] == "on" else "nmof"
#         return indicators

#     def poll(self):
#         """Poll content for the text box."""
#         indicators = self.get_indicators()
#         status = " ".join(indicators.values())
#         return status

# import re
# import subprocess

# from libqtile.widget import base

# class NumLockIndicator(base.ThreadPoolText):
#     """Widget to show the current Num Lock state."""

#     defaults = [("update_interval", 0.5, "Update Time in seconds.")]

#     def __init__(self, **config):
#         base.ThreadPoolText.__init__(self, "", **config)
#         self.add_defaults(NumLockIndicator.defaults)

#     def get_numlock_status(self):
#         """Return the current state of the Num Lock key."""
#         try:
#             output = self.call_process(["xset", "q"])
#         except subprocess.CalledProcessError as err:
#             output = err.output
#             return ""
#         if output.startswith("Keyboard"):
#             match = re.search(r"Num\s+Lock:\s*(\w*)", output)
#             if match:
#                 return "NUM" if match.group(1) == "on" else "N̶U̶M̶"
#         return ""

#     def poll(self):
#         """Poll content for the text box."""
#         return self.get_numlock_status()

import math

print("hello word")
