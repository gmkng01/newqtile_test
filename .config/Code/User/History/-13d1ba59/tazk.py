from colorthief import ColorThief
# import colorsys
import re, os
import json

home = os.path.expanduser('~')

def extract_text(filename):
    with open(filename, 'r') as file:
       text = file.read()

    match = re.search(r"/home.*", text, re.MULTILINE)  # Multiline search
    if match:
      return match.group()
    else:
      return ""

# Example usage
wall_path = extract_text(f"{home}/.config/nitrogen/bg-saved.cfg")

ct=ColorThief(wall_path)
palette = ct.get_palette(color_count=5)

wall_color = {
    'bk':               f"#{palette[0][0]:02X}{palette[0][1]:02X}{palette[0][2]:02X}",
    'bk2':              f"#{palette[1][0]:02X}{palette[1][1]:02X}{palette[1][2]:02X}",
    'fr':               f"#{palette[2][0]:02X}{palette[2][1]:02X}{palette[2][2]:02X}",
    'fr2':              f"#{palette[3][0]:02X}{palette[3][1]:02X}{palette[3][2]:02X}",
    'gr':               f"#{palette[3][0]:02X}{palette[3][1]:02X}{palette[3][2]:02X}"
}
# print("Color 1:", color1)
# print("Color 2:", color2)
# print("Color 3:", color3)
# print("Color 4:", color4)
# print("Color 5:", color5)