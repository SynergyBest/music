tell application "iTunes"
	if player state is playing then
		pause
	end if
end tell
tell application "Spotify"
	if player state is playing then
		pause
	end if
end tell
