-- Duplicate Firefox's currently open tab
-- by Jordan Saints, www.jordansaints.com

tell application "Firefox"
	activate
end tell
delay 0.2
tell application "System Events" to key code 37 using {command down} -- cmd+L focuses on address bar
tell application "System Events" to key code 36 using {option down} -- alt+Return duplicates tab in foreground