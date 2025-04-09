#!/bin/bash

for script in ./install_*.sh; do
	echo
	echo "### Running $script ###"
	"$script"
done

