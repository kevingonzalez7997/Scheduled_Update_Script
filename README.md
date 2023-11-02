# Kevin Gonzalez
# September 26, 2023

## Server Update Script

This Bash script, serves the purpose of automating server updates, recording the number of upgradeable files, and storing this information in a file named with today's date.

### Script Overview

- The script first retrieves the current date in the format YYYY-MM-DD and stores it in the variable `$file_name_daily`.

- Using a combination of commands, it updates the system, captures the last line of the update output (containing information on upgradeable files), extracts the first sentence, and overwrites the result into the file created earlier.

- Upon completion, the script provides feedback, confirming that the files have been updated, and upgrade information has been stored.

### Automation with Cron

To automate this script, a cron job is set up to run it at a specific schedule. The following schedule is defined to run the script every Friday at 11:00 PM:

```cron
0 23 * * 5
