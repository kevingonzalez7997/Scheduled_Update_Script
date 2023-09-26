#!/bin/bash
#Kevin Gonzalez
#2023-08-30

#This bash script will update the server
#The amount of upgradeable files will be recorded
#The recorded amount will then be stored in a file with today's date

#This command will grab today's date and format it into YYYY-MM-DD
#It is stored into a variable for later use
#$() for variable commmands
file_name_daily=$(date +update_"%F".txt)

# We are able to use pipe to make an oneliner
# We start by updating the system and using that output as the input for our next command
# tail will grab the last line of the update output, -n 1 to only focus on the last line as there is the info
# Now that we have just the last line we only want the first sentence so we CUT it using '.' as what separates it, as 1 to show we just want the first appearance
# lastly we overwrite the results into the file we created in the previous step
sudo apt update | tail -n 1 | cut -d '.' -f 1 > $file_name_daily

echo "files have been updated and upgrade information has been stored"

# Lastly we have to create the corn
# cron allows us to run tasks automatically on a given time/schedules
# First we open our crontab 
# crontab -e
# Then we add our given schedule 0 23 * * 5
# 0=min 23=hr *=day *=month 5=5th day of the week , Friday
# Follow that by the path of where the script is 
# In this case it was in the home directory
# 0 23 * * 5 /~/update_server_script.sh
