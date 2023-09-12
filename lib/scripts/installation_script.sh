#!/bin/bash
# snort,nmap and mpstat

toolInstallOrNot() {
	local tool="$1"
	if [ -x "$(command -v $tool)" ]; then
  		return 0
	else
		return 1
	fi
}

printTheOutput() {
	local toolName="$1"
	if toolInstallOrNot $toolName; then
		echo "$toolName already installed"
	else
		sudo apt-get install $toolName
	fi

}

installTheTools() {
	printTheOutput snort
	printTheOutput nmap
	printTheOutput mpstat
	printTheOutput gedit
}

installTheTools

# ip addr show | grep -oE 'inet ([0-9]{1,3}\.){3}[0-9]{1,3}' | awk '{print $2}'
