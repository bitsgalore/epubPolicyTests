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
    
    # Generate name for output file, based on directory name
    epubName=$buildDir"$dirName".epub

    echo $epubName

    # Go to dir with content
    cd "$directory"

    # Create ZIP file and add mimetype resource without compressing
    zip -X0 "$epubName" mimetype

    # Add remaining files with compression
    zip -rDX9 "$epubName" * -x mimetype
      
done < <(find "$contentDir" -type d -maxdepth 1 -mindepth 1 -print0)

