#!/bin/bash

parent_directory="$(dirname $0)"
echo $parent_directory

for script in $parent_directory/install_*.sh; do
	echo
	echo "### Running $script ###"
	"$script"
done

