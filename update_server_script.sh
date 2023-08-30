#!/bin/bash
#Kevin Gonzalez
#2023-08-30

#This bash script will update the server
#The amount of upgradeable files will be recorded
#The recorded amount will then be stored in a file with today's date



#This command is going to update the server and store results in update_server
#-y will automatically type yes to any prompt by sudo apt update
#$() is to be able to run commands inside of variables
#It is stored in a variable for later use
update_server=$(sudo apt update -y)


#This command will grab today's date and format it into YYYY-MM-DD
#It will use +update to put the word update before formating
#It is stored into a variable for later use
#$() for variable commmands
file_name_daily=$(date +update_"%F".txt)


#First we create a variable, output_from_update
#Then we run the command echo $(update_server) to get the content of our variable update_server
#Then we use | pipe to take that output and use it in the awk command
#awk will scan line by line, we tell it where to look, 'packages'
#This is based on the output of sudo apt update 
#The $1,... is to print nth many elements/words in the lines that match with the word packages
#1-6 are selected so a full sentence can be printed
output_from_update=$(echo "$update_server" | awk '/packages/{print $1,$2,$3,$4,$5,$6}')


#This command will take the line that has been stored in output_from_update
#It will create a file in our variable file_name_daily and put the content of output_from_update in it
echo "$output_from_update" > "$file_name_daily"


#This will print confirmation that the task is complete
echo "files have been updated and upgrade information has been stored"
