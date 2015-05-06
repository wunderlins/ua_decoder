#!/usr/bin/env bash

basedir=`dirname ${BASH_SOURCE[0]}`
export PATH="$PATH:$basedir"
#echo "basedir: $basedir"
#echo $PATH

which realpath >/dev/null 2>&1
if [[ $? != 0 ]]; then
	cat <<- EOT

Error, realpath required, not found.

Make sure it's location is in set your \$PATH environment variable.

If the utility is not installed, your package manager might provide a way to 
install the realpath utility. If not, you can get an C source implementation 
here:
http://stackoverflow.com/questions/284662/how-do-you-normalize-a-file-path-in-bash#284664

Installation of realpath
* Download the file, save it as realpath.c inside the project directory
* make sure you have a C compiler (apt-get install build-essential on debian)
* compile it with $ gcc -o realpath realpath.c
* make sure realpath is in your PATH, ie. export PATH=./:\$PATH

EOT

#echo $PATH | grep '\./:' >/dev/null; 
return 1
fi

export basedir=`realpath $basedir`

PS1="<\[\033[37m\]\u\[\033[0m\]@\[\033[31m\]\h\[\033[0m\]> \[\033[33m\]\W\[\033[0m\]\[\033[36m\]%\[\033[0m\] "
