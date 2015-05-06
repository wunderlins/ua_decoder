#!/usr/bin/env bash

export basedir=`dirname ${BASH_SOURCE[0]}`"/.."

if [[ $(which realpath) != 0 ]]; then
	cat <<- EOT

Error, realpath required.

Your package manager might provide a way to install the realpath utility. If 
not, you can get an C source implementation here:
http://stackoverflow.com/questions/284662/how-do-you-normalize-a-file-path-in-bash#284664

Installation of realpath
* Download the file, save it as realpath.c inside the project directory
* make sure you have a C compiler (apt-get install build-essential on debian)
* compile it with $ gcc -o realpath realpath.c
* make sure realpath is in your PATH, ie. export PATH=./:$PATH

EOT

return 1
fi

basedir=`$basedir/bin/realpath $basedir`

PS1="<\[\033[31m\]\h\[\033[0m\]:\[\033[36m\]$server\[\033[0m\]> \[\033[34m\]\W\[\033[0m\]\[\033[37m\]%\[\033[0m\] "
