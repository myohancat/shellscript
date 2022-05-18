#!/bin/sh

function update_source
{
	if [ -d .svn ] ; then
		echo " svn update.."
		svn up
		return 0
	fi

	if [ -d .git ] ; then
		echo " git pull.."
		git pull
		return 0
	fi

	for file in *
	do
		if [ -d "$file" ]; then
			echo "enter $file...."
			cd "$file"
				update_source
			cd ..
		fi
	done
}


update_source

