FILE=~/.tmux.conf
if test -f "$FILE"; then
	echo "$FILE exists, replacing it with github-config"
	cp tmux.conf $FILE
else
	echo "$FILE does not exist, adding config"
	cp tmux.conf $FILE
fi

