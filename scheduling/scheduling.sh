#!/bin/bash


# you should use <<at>> for scheduling one time jobs
# you can see your jobs by using <<atq>>
# you can remove your job by using <<atrm jobId>> 

$log_file=job_result.log

echo "you will see this in that file at $(date)" > $log_file 