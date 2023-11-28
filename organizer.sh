#! /usr/bin/bash 

# making sure there is 1 argument
if [ $# -ne 1 ]
then
    echo -e "\n***************** USAGE *********************"
    echo -e "        ./organizer.sh directory_path         \n"
else
    dir=$1
    # check if directory exists
    if [ -d "$dir" ]
    then
        # reading the directory names creating them for organizing files
        echo " enter the name of the dir that will contain all text files "
        read txtdir
        mkdir $txtdir
        textdir="$dir/$txtdir"
        echo " enter the name of the dir that will contain all mp3 files "
        read mp3dir
        mkdir $mp3dir
        musicdir="$dir/$mp3dir"
        echo " enter the name of the dir that will contain all image files "
        read picdir
        mkdir $picdir
        imagedir="$dir/$picdir"
        echo " enter the name of the dir that will contain all video files "
        read viddir
        mkdir $viddir
        videodir="$dir/$viddir"
        # iterating through each file in the directory , check file extension and move the files accordingly
        for file in "$dir"/*
        do
            if [ -f "$file" ]
            then    
                if [[ "$file" == *.txt ]]   
                then
                    mv "$file" $textdir
                elif [[ "$file" == *.mp3 ]]
                then    
                    mv "$file" $musicdir  
                elif [[ "$file" == *.jpg || "$file" == *.jpeg || "$file" == *.png ]]    
                then    
                    mv "$file" $imagedir
                elif [[ "$file" == *.mp4 || "$file" == *.avi || "$file" == *.mov ]]
                then    
                    mv "$file" $videodir
                fi
            fi
        done
        # if any of the directory we created is empty then this deletes it 
        directories=("$textdir" "$musicdir" "$imagedir" "$videodir")
        for dir in "${directories[@]}"
        do  
            if [ -z "$(ls "$dir" 2>/dev/null)" ]
            then    
                rmdir "$dir"
            fi      
        done
        
    else    
        echo -e "\n ******************INVALID DIRECTORY *********************\n"
    fi
fi                    