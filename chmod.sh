#!/bin/sh

# convert file permission
files=`find . -name "*.[cChHsS]" -or -name "*.cpp" -or -name "*.hpp" -or -name "*.java"`

for file in $files
do
	chmod 664 $file
done


# convert directory permission
folders=`find . -type d`

for folder in $folders
do
	chmod 775 $folder
done


# convert executable permission
files=`find . -name "*.sh"`

for file in $files
do
	chmod 775 $file
done

