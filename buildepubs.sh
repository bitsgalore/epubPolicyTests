#!/bin/bash

# Build Epubs from directory structure

# Installation directory
instDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Content directory - every subdir here represents one epub
contentDir="$instDir"/content/

# Build directory - where newly created epubs are stored

buildDir="$instDir"/build/

# Empty build dir

rm "$buildDir"/*

# **************
# MAIN PROCESSING LOOP
# **************

counter=0

while IFS= read -d $'\0' directory ; do
    dirName=$(basename "$directory")
    
    # Generate name for output file, based on directory name
    epubName=$buildDir"$dirName".epub

    # Convert to absolute path
    epubNameAbs=$(readlink -f $epubName)

    echo $epubNameAbs

    # Go to dir with content
    cd "$directory"

    # Create ZIP file and add mimetype resource without compressing
    zip -X0 "$epubNameAbs" mimetype

    # Add remaining files with compression
    zip -rDX9 "$epubNameAbs" * -x mimetype

    # Back to working dir
    cd "$instDir"
      
done < <(find "$contentDir" -maxdepth 1 -mindepth 1 -print0 -type d)

