#!/bin/sh

#!/bin/bash

BEGIN=$(date +%s)

echo Starting Stopwatch...

while true; do
	NOW=$(date +%s)
	DIFF=$(($NOW - $BEGIN))
	SECS=$(($DIFF % 60))
	MINS=$(($(($DIFF % 3600)) / 60))
	HOURS=$(($(($DIFF % 86400)) / 3600))
	DAYS=$(($DIFF / 86400))

	# \r is a "carriage return" - returns cursor to start of line
	printf "\r%3d Days, %02d:%02d:%02d" $DAYS $HOURS $MINS $SECS
	sleep 0.25
done

