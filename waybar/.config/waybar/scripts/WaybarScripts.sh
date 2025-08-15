#!/bin/bash

config_file=$HOME/.config/hypr/UserConfigs/UserDefaults.conf

if [[ ! -f "$config_file" ]]; then
	echo "Err: Config file not found"
	exit 1
fi

config_content=$(sed 's/\$//g' "$config_file" | sed 's/ = /=/')

# Source the modified content directly from the variable
eval "$config_content"

if [[ "$1" == "--btop" ]]; then
	$terminal --title btop sh -c 'btop'
fi
