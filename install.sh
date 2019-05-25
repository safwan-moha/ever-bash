#!/bin/bash

MY_PATH=`( cd "$MY_PATH" && pwd )`

if [ "/usr/local/bin/save" = "$0" ]
then
	if [ $1 = "-s" ]
	then
		if [ "$2" = "" ]
		then
			echo "$(tput setaf 1)Wrong usage:$(tput sgr0) $(tput setaf 2)to search: save -s 'search-text'$(tput sgr0)"
		else
			search=""
			for ((i=2;i<=$#;i++));
			do
				search="$search ${!i}"
			done;
			sh -c "grep $search ~/.save/history -m 20 -n -i | sed 's/:/  :/'"
			read -p 'copy line: ' linenum
			result=$(head -${linenum} ~/.save/history | tail -1 | tr -d '\012')
			hay=$(echo $result| cut -d'#' -f 2)
			sh -c "echo $hay | tr -d '\012' | xclip -selection clipboard"
			echo "$(tput setaf 4)Copied:$(tput sgr0) $(tput setaf 1)$hay$(tput sgr0)"
		fi
	elif [ $1 = "-d" ]
	then
		echo "Delete feature under development"
	elif [ $1 = "-h" ]
	then
		echo "$(tput setaf 4)to save: save 'any-command'$(tput sgr0)"
		echo "$(tput setaf 4)to search: save -s 'search-text'$(tput sgr0)"
		echo "$(tput setaf 4)to delete: save -d 'search-text'$(tput sgr0)"
	else
		if [ "$2" = "" ]
		then
			echo "$(tput setaf 1)Wrong usage:$(tput sgr0) $(tput setaf 2)to search: save -s 'search-text'$(tput sgr0)"
			command=$(history | tail -n 2 | head -n 1 | while read c1 c2; do echo $c2; done)
			echo "$(tput setaf 4)Last command: $(tput sgr0) $command"
			read -p 'save-name: ' savename
			sudo sh -c "echo $savename#$command >> ~/.save/history"
			echo "$(tput setaf 4)Saved...$(tput sgr0)"
		else
			command=""
			for ((i=1;i<=$#;i++));
			do
				command="$command ${!i}"
			done;
			read -p 'save-name: ' savename
			sudo sh -c "echo $savename#$command >> ~/.save/history"
			echo "$(tput setaf 4)Saved...$(tput sgr0)"
		fi
	fi
else
	echo " "
	echo " "
	echo "$(tput setaf 4)Installing EVER-BASH...$(tput sgr0)"
	echo " "
	sh -c "sudo apt-get install xclip"
	echo " "
	sh -c "sudo cp $MY_PATH/install.sh /usr/local/bin/save"
	sh -c "sudo chmod -R 775 /usr/local/bin/save"
	if [ ! -d /var/lib/save ]; then
		sh -c "mkdir ~/.save"
	fi
	sh -c "touch ~/.save/history"
	# sh -c "sudo chmod -R 775 /var/lib/save/history"
	echo "$(tput setaf 2)Installation success$(tput sgr0)"
	echo "$(tput setaf 4)Please type 'save -h' for help$(tput sgr0)"
fi

