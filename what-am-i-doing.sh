#!/bin/bash
minutes_between_pictures=10

sleep_interval="$((60*$minutes_between_pictures))"
while [ 1 -le 2 ]
do
    directory_name=$(date +"%F")
    mkdir -p $directory_name
    mplayer -vo png -frames 1 tv:// -quiet
    filename=$(date +"%T").png
    mv 00000001.png $directory_name/$filename
    sleep $sleep_interval
done
