#!/bin/bash


# you should use <<at>> for scheduling one time jobs

# you can see your jobs by using <<atq>>

# you can remove your job by using <<atrm jobId>> 

#crontab -e: Edit your crontab file (opens your default text editor).

#crontab -l: List all your currently active scheduled tasks.

#crontab -r: Remove all your current cron jobs (use with caution!).
#Minute: The exact minute the command runs 0 - 59
#Hour: The hour of the day (24-hour clock)0 - 23 
#Day of Month: The day of the month 1 - 31
#Month: The month of the year 1 - 12 (or Jan-Dec)
#Day of Week: The day of the week 0 - 6 (Sunday is 0 or 7)
# command: m h dom moy dow

#crontab will schedule the job multiple times unless you cancel it

$log_file=job_result.log

echo "you will see this in that file at $(date)" > $log_file 