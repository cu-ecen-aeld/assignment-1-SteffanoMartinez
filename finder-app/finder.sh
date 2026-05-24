#!/bin/bash

# Assigment 1 Instructions

# 1st arg is a PATH to a directory in the file system, var name is filesdir
# 2nd arg is a STR text, to be searched within the files, var name called searchstr

# Exits with ERRCODE 1 and print statements if any of the arguments above where not provided.
# Exits with ERRCODE 1 and print statements if filesdir does not represent a directory on the FS.

# Prints a message "The number of files are X and the number of matching lines are Y" 
# X is the number of files in the directory and subdirectories.
# Y is the number of matching lines found in the respective files. (where searchstr matched)

# The invocation of this script will run as follows: 
# ./finder.sh /a/path/somewhere <A_STRING>

filesdir=$1
searchstr=$2

# Build the argument's checker first.
# LESSON: TEST scope requires a $<var_name> instead of just <var_name> as the latter would just equate to true as its treated as a string....

if [ -z $filesdir ] || [ -z $searchstr ]
then 
    echo You did not provide a FILEPATH and/or a STRING to match.
    exit 1    
fi

# Check that the filesdir represents a directory in the FS 
if [ ! -d $filesdir ]
then 
    echo Directory passed is not a DIR type
    exit 1
fi

# Obtain X and Y
# SYMLINKS lrwxrwxrwx  1 steffano1213 steffano1213    7 May 23 18:27 conf -> ../conf (Are not counted in FIND unless -L flag)

if [ -n $searchstr ]
number_of_files_found_in_dir_and_subdir=$( find -L $filesdir -type f | wc -l )
then
    all_string_matches=$(  find -L $filesdir -type f | xargs grep $searchstr | wc -l)
    if [ $all_string_matches -gt 0 ]
    then
        echo The number of files are $number_of_files_found_in_dir_and_subdir and the number of matching lines are $all_string_matches
    fi
fi




