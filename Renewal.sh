#! /bin/bash
# Justinmind 6.7.0 renewal script.
# EMRYS LEE Composed. license GNU. https://emrys.im
# Mail: emrys.lee[at]post.harvard.edu
# Build by September 1, 2015
# Licensed to @best_919 to use.

#Remove necessary files

rmJustfile(){
    
    dr=$1
    
    odometer=0
    
    OLD_IFS="$IFS"
    
    IFS=","
    
    dir_c=($dr)
    
    IFS="$OLD_IFS"
    
    for d in $dir_c
    
    do
    
        if [ -f "/Applications/Justinmind.app/Contents/Resources/Java/configuration/.dat" ] && [ -d "$d/.datastorage" ] && [ -d "$d/Justinmind" ] && [ -d "$d/.configprops" ] || [ -d "/Applications/Justinmind.app" ]; then
    
            #rm ".datastorage" & ".configprops" & "Justinmind" dir and ".dat" file
    
            rm /Applications/Justinmind.app/Contents/Resources/Java/configuration/.dat && rm -rf $d/.configprops && rm -rf $d/.datastorage # && rm -rf $d/Justinmind
    
            let odometer=odometer+1
    
            echo "Well done! Clean up, Continue to use for 30 days, please."
    	
    	else

    		echo "You not install Justinmind."
        fi;
    
    done;
    
    if [ $odometer -gt 0 ]; then

		ID=`ps -ef | grep "Justinmind" | grep -v "$0" | grep -v "grep" | awk '{print $2}'`

		for id in $ID
		do

			kill -9 $id

		done

		sleep 3s; 

		open -a /Applications/Justinmind.app

    fi
}

# Get the user name and user directory

eachUserdirectory(){
    
    local -a ex

    for directory in $1*
                        
    do
                        
        if [ -d $directory ]; then
                        
            vars=(${directory//// })
                        
            #Exclude Guest's and Shared's directory
                        
            if [ "${vars[1]}" != "Shared" ] && [ "${vars[1]}" != "Guest" ]; then
                        
                ex+=$directory,
                        
            fi;
                        
        fi;
                        
    done;
                        
    rmJustfile "$ex"
}
                        
# Start Script
                        
if [[ "x$1" == 'x' ]]; then
                        
    eachUserdirectory "/Users/"
                        
fi;