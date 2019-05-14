#!/bin/bash

MY_PATH=`( cd "$MY_PATH" && pwd )`

if [ "/usr/local/bin/save" = "$0" ]
then
	if [ $1 = "-s" ]
	then
		search=""
		for ((i=2;i<=$#;i++));
		do
			search="$search ${!i}"
		done;
		sh -c "grep $search /var/lib/save/history -m 10 -n -i"
		read -p 'copy line: ' linenum
		result=$(head -${linenum} /var/lib/save/history | tail -1 | tr -d '\012')
		hay=$(echo $result| cut -d':' -f 2)
		sh -c "echo $hay | tr -d '\012' | xclip -selection clipboard"
		echo Copied... $hay

	elif [ $1 = "-h" ]
	then
		echo to save: save 'any-command'
		echo to retrive: save -s 'search-text'
	else
		command=""
		for ((i=1;i<=$#;i++));
		do
			command="$command ${!i}"
		done;
		read -p 'save-name: ' savename
		sudo sh -c "echo $savename:$command >> /var/lib/save/history"
		echo 'Saved...'
	fi
else
	echo " "
	echo " "
	echo "Installing EVER-BASH..."
	echo " "
	echo " "
	sh -c "sudo cp $MY_PATH/install.sh /usr/local/bin/save"
	sh -c "sudo chmod -R 775 /usr/local/bin/save"
	sh -c "sudo mkdir /var/lib/save"
	sh -c "sudo touch /var/lib/save/history"
	echo "Installation success"
	echo "Please type 'save -h' for help"
fi

