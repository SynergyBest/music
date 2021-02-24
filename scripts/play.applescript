tell application "iTunes"
	if player state is paused then
		play
	end if
end tell
tell application "Spotify"
	if player state is paused then
		play
	end if
end tell
