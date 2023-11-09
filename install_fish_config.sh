FILE=~/.config/fish/config.fish
if test -f "$FILE"; then
	echo "$FILE exists, replacing it with github-config"
	cp config.fish $FILE
else
	echo "$FILE does not exits, aborting"
fi

