FILE=~/.tmux.conf
parent_directory="$(dirname $0)"
echo $parent_directory

if test -f "$FILE"; then
	echo "$FILE exists, replacing it with github-config"
else
	echo "$FILE does not exist, adding config"
fi
cp $parent_directory/tmux.conf $FILE
