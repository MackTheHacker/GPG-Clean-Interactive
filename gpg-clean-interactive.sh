#! /bin/bash

#An interactive version of my gpg-clean shell script. 

echo "Which file would you like to encrypt? (must be in current directory)"
read userFile

if [ -z $(find . -type f -name $userFile 2>/dev/null) ]; then 
	(>&2 echo "ERROR: Input file provided does not exist in current directory. Git Gud.")
else
	echo "File found in directory. Now encrypting..."
	gpg --cipher-algo AES256 -o $userFile.gpg -c $userFile 
	echo "File has finished encrypting. Would you like to remove the original file? (y/N)" 
	read userChoice

	if [ $userChoice = "y" ]; then 
		echo "Removing file..."
		rm $userFile
	else 
		echo "Skipping removal"
	fi

	echo "Done"

fi

