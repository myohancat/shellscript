#!/bin/sh

TODAY=`date +"%Y%m%d"`
for file in *
do
	if [ -d "$file" ]; then
		ZIP_FILE=$file.$TODAY.tgz
		
		tar --exclude-vcs -c -v -z -f $ZIP_FILE $file
	fi
done
