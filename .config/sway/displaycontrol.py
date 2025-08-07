import subprocess
import json
import sys

fetchdisplay = ["swaymsg", "-t", "get_outputs", "--raw"]
stopdisplay = ["swaymsg", "output", "eDP-1", "disable"]
startdisplay = ["swaymsg", "output", "eDP-1", "enable"]

result = subprocess.run(fetchdisplay, capture_output=True, text=True)
output = result.stdout

try:
    JSON = json.loads(output)
except json.JSONDecodeError:
    notification = ["notify-send", "Error:Failed to parse JSON"]
    print("Failed to parse JSON output")
    sys.exit(1)

for entry in JSON:
    if entry['name'] == "eDP-1":
        if entry['active']:
            subprocess.run(stopdisplay)
            sys.exit(0)
        elif not entry['active']:
            subprocess.run(startdisplay)
            sys.exit(0)

notification = ["notify-send", "eDP-1 not found"]
subprocess.run(notification)
