#!/bin/bash

# Build Epubs from directory structure

# Content directory - every subdir here represents one epub
contentDir="./content/"

# Build directory - where newly created epubs are stored

buildDir="./build/"

# **************
# MAIN PROCESSING LOOP
# **************

counter=0

while IFS= read -d $'\0' directory ; do
    dirName=$(basename "$directory")
    counter=$((counter+1))
    
    # Generate name for output file, based on directory name
    epubName=$buildDir/"$dirName".epub
    
    echo $epubName 
    # Run Epubcheck
    #java -jar $epubcheckJar "$epubName" -out $outputEpubcheck 2>tmp.stderr
      
done < <(find "$contentDir" -type d -maxdepth 1 -mindepth 1 -print0)

