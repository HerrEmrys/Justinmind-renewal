#! /bin/bash 
# Justinmind 6.7.0 renewal script.
# EMRYS LEE Composed. license GNU. https://emrys.im
# Mail: emrys.lee[at]post.harvard.edu
# Power by September 1, 2015
# Licensed to @best_919 to use.

#Remove necessary files

rmJustfile(){

	d=$1

	val1="y"

	read -p "Users directory is \"$1\" [Y/n] defaut \"Y\": "  val1

	if [ "$val1" = "n" ]; then

		read -p "Enter user directory (example: /Users/[Your name] | Note the case of letters) : " val2

		d=$val2
		
	fi;

	if [ -f "/Applications/Justinmind.app/Contents/Resources/Java/configuration/.dat" ] && [ -d "$d/.datastorage" ] && [ -d "$d/Justinmind" ] && [ -d "$d/.configprops" ]; then 

		#rm ".datastorage" & ".configprops" & "Justinmind" dir and ".dat" file

		rm /Applications/Justinmind.app/Contents/Resources/Java/configuration/.dat && rm -rf $d/.configprops && rm -rf $d/.datastorage && rm -rf $d/Justinmind

	    echo "Well done! Clean up, Continue to use for 30 days, please."

	    exit 1
	
	else

		echo "Faile clean or not install \"Justinmind\"."

	fi;
	
}

# Get the user name and user directory

eachUserdirectory(){

    for directory in $1/*

	do

		if [ -d $directory ]; then

			vars=(${directory//// })

			#Exclude Guest's and Shared's directory

			if [ "${vars[1]}" != "Shared" ] && [ "${vars[1]}" != "Guest" ]; then

					#Executive remove
					
					rmJustfile "$directory"

					exit 1

			fi;

		fi;
	done
}

# Start Script

if [[ "x$1" == 'x' ]]; then

    eachUserdirectory "/Users"

fi;


