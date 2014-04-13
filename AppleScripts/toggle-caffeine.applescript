-- Turn OS X app Caffeine on or off. Most
-- useful when combined with a keyboard shortcut.
-- by Jordan Saints, www.jordansaints.com

tell application "Caffeine"
	if active then
		turn off
	else
		turn on
	end if
end tell