#!/bin/bash

# $1 option, 0 last run, 1 find particular run
# $2 run number
# $3 min number of hits

echo $dato

# define red and green color varuables
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

#myPath=/nfs/dust/ilc/group/flchcal/AHCAL_Commissioning_2017_2018/2018Apr/Full_stack_test/cosmics/slcio/
myPath=$reconstructedSlcioPath
#myPath=/home/lomidze/Qt_Examples/fakedata/

echo $myPath

# find last created .slcio file
function lastRun(){
    myfile=
    myfile=$(find $myPath*.slcio -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" ")

    if [ -z "$myfile" ]; then
       	echo -e "${RED} Run $1 have not found! ${NC}"
	exit 1;
    else
	 echo -e "${GREEN}PROCESSED File:${NC} $myfile"
    fi
}


# find particular run
function particularRun(){
    #echo $myPath
    #echo $1
    myfile=
    myfile=$(find "$myPath" -name "*$1.slcio")
    if [ -z "$myfile" ]; then
       	echo -e "${RED} Run $1 have not found! ${NC}"
	exit 1;
    else
	 echo -e "${GREEN}PROCESSED File:${NC} $myfile"
    fi
}

# get file according to selection option
if [ $1 = "0" ]; then
    lastRun
else
    particularRun $2
fi



######################################################
#         prepare xml file                           #
######################################################

#get fresh new xml file 
#cp $evenDpath/CED_Cosmics_May2018.xml $evenDpath/eventDisplay.xml
cp ../xml/CED_Cosmics_May2018_v2.xml ../xml/eventDisplay.xml
# add run file to the xml
sed -i "s#INPUT#$myfile#g" ../xml/eventDisplay.xml
sed -i "s#MinHits#$3#g" ../xml/eventDisplay.xml

echo -e "${GREEN}XML file UPDATED ${NC} "
