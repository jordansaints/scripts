-- Open Chrome's current tab in Safari
-- by Jordan Saints, www.jordansaints.com

tell application "Google Chrome"
	activate
end tell
delay 0.2
tell application "System Events" to key code 37 using {command down} -- cmd+L FOCUS on URL in Chrome
delay 0.1
tell application "System Events" to key code 8 using {command down} -- cmd+C COPY
delay 0.1

tell application "Safari"
	activate
end tell
delay 0.5
tell application "System Events" to key code 17 using {command down} -- NEW TAB
delay 0.2
tell application "System Events" to key code 37 using {command down} -- cmd+L FOCUS on URL in Chrome
delay 0.1
tell application "System Events" to key code 9 using {command down} -- cmd+V PASTE
delay 0.1
tell application "System Events" to key code 36 -- ENTER!