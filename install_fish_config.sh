FILE=~/.config/fish/config.fish
parent_directory="$(dirname $0)"
echo $parent_directory

if test -f "$FILE"; then
	echo "$FILE exists, replacing it with github-config"
	cp $parent_directory/config.fish $FILE
else
	echo "$FILE does not exist, aborting"
fi

