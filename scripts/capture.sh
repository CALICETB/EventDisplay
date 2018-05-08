#!/bin/bash

# Read event info from the log file
#while IFS='' read -r line || [[ -n "$line" ]]; do
#    echo "Text read from file: $line"
#done < "$1"
eventInfo=($(cat ../build/myLog.txt));

myname=${eventInfo[0]}_${eventInfo[1]}_${eventInfo[2]}_${eventInfo[3]}
mytitle="Run: ${eventInfo[0]} Event: ${eventInfo[1]} Date: ${eventInfo[2]} Time: ${eventInfo[3]}"

echo $myname;
echo $mytitle;

# Save GLCED image 
import -widow 'C Event Display (CED)' tmp.png
echo "Event image successfully saved"

# Apply label
convert -pointsize 30 -fill yellow -draw "text 800,950 \"$mytitle\" " tmp.png  ../Images/$myname.png

