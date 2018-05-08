This package created to run GLCED event display and display events

Installation:

save archive in your naf folder
better make a new folder
# mkdir evendDisplay
# cd eventDisplay

get the package 
# git clone https://github.com/CALICETB/EventDisplay.git

extract it 
# cd EventDisplay/build
# qmake -project ../eventDisplayRunner -o eventDisplay.pro 
# qmake
# make

# qmake -project ../eventDisplayRunner/ -o eventDisplay.pro
# qmake
# make

Modify paths in the ../scripts/setup.sh
and source it:
# source ../scripts/setup.sh


Now you are ready to use the application, to start it type:
# ./eventDisplay &

Please note that event display runs on reconstructed slcio files only. 


How to use:

1. Start GUI (you need to start GUI only once in the begining)

2. 
Select one of options
"Last run" - if you want to display events from latest reconstructed slcio.
"Enter manually" - type run number of previously taken data. An example "5825"
"Select run" - not yet implemented


3. Click on configure
If you have entered reconstructed slcio file path correctly, you will see green message in the shell "XML file UPDATED", otherwise an error message will appear and please check file path or entered run number.

4. Start Marlin (to close Marlin do "ctr c" in the newly opened xterm, marlin will be stopped and xterm will disappear)

To show event from other run do 2 (if needed), then 3 and 4.



