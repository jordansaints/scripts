-- Duplicate Chrome's currently open tab in the background
-- by Jordan Saints, www.jordansaints.com

tell application "Google Chrome"
	activate
end tell
tell application "System Events" to key code 37 using {command down} -- cmd+L focuses on omnibar
tell application "System Events" to key code 36 using {command down} -- cmd+Return duplicates tab in background