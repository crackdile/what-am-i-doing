#!/bin/bash

minutes_between_pictures=10
kernel=$(uname -a)

if [[ $kernel =~ .*Darwin.* ]] # Check if Mac OS
then
    capture_command() {
	imagesnap -w 1.5 00000001.png
    }
else 
    capture_command() {
	mplayer -vo png -frames 1 tv:// -quiet
    }
fi

sleep_interval="$((60*$minutes_between_pictures))"
while [ 1 -le 2 ]
do
    directory_name=$(date +"%F")
    mkdir -p $directory_name
    capture_command
    filename=$(date +"%T").png
    mv 00000001.png $directory_name/$filename
    sleep $sleep_interval
done
