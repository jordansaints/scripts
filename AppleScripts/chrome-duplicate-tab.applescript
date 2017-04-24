-- Duplicate Chrome's currently open tab in the background

tell application "Google Chrome"
	activate
	tell front window
		set theURL to URL of active tab
		make new tab with properties {URL:theURL}
	end tell
end tell
