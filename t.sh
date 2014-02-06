#!/bin/bash

touch /home/bmoss/scripts/bash/test_status.txt
doc="/home/bmoss/scripts/bash/test_status.txt"

function run_app {
	app=$(head "$doc")
	extension="${app##*.}"

	if [ "$extension" = "sh" ]; then
		source ~/.bashrc
		source $app
	else
		python $app
	fi
}

if [ "$1" = "" ]; then
	run_app
elif [ "$1" = "reset" ]; then
	echo "/home/bmoss/scripts/bash/echo_test.sh" > "$doc"
	run_app
elif [ "$1" = "path" ]; then
	echo && head $doc && echo
elif [ "$1" = "set" ]; then
	name=$(readlink -f $2)
	echo $name > "$doc"
	echo -e "\nPath set to: $name\n"
else
	echo -e "\nUsage: t <command> [path]\n"
	echo "t          runs app"
	echo "t set      sets the path to [path]"
	echo "t reset    resets path to echo_test.sh"
	echo -e "t path     prints the current path\n"
fi