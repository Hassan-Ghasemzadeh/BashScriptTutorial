#!/usr/bin/env bash


# -e: (errexit) Exit immediately if a command exits with a non-zero status.
# -u: (nounset) Treat unset variables as an error when substituting.
# -o pipefail: The return value of a pipeline is the status 
# of the last command to exit with a non-zero status, or zero if no command exited with a non-zero status.
set -euo pipefail


# IFS: (Internal Field Separator) is used by the shell to determine how to split a string into words.
# By default, IFS is set to space, tab, and newline.
# Setting it to $'\n\t' means that only newlines and tabs will be used as delimiters,
# which can help prevent issues with spaces in file names or other strings.
IFS=$'\n\t'

readonly GUARDIAN_THRESHOLD=80
readonly LOG_FILE="/var/log/resource_guardian.log"
readonly TMP_FILE=$(mktemp /tmp/guardian_XXXXXX)


# Ensure the temporary file is removed on exit
cleanup(){
    rm -f "$TMP_FILE"
}

trap cleanup EXIT

log_msg(){
    local level=$1
    local message=$2
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$level]-$message" | tee -a "$LOG_FILE"
}

check_resource(){
    log_message "INFO" "Checking for high-consuming processes (over $CPU_THRESHOLD%)..."

    #process status -h(no header) to remove header -e(every) -o(format) to select the column we want
    #pid:process id , pcpu: percent cpu , comm: command
    #-pcpu:from high to low like 15,12,9,3,2
    ps -h -eo pid,pcpu,comm --sort=-pcpu > "$TMP_FILE"

    while read -r pid cpu comm
    do
        local cpu_int=${cpu%.*}
        if [[ $cpu_int -ge $GUARDIAN_THRESHOLD ]]
        then
            log_message "WARNING" "Process $comm (PID: $pid) is consuming $cpu% CPU."
        fi
    done < <(head -n 5 "$TEMP_FILE")
}
main(){
    if [[ $EUID -ne 0 ]]
    then
        log_message "ERROR" "This script must be run with sudo access."
        exit 1
    fi
    check_resource
    log_message "INFO" "Resource Guardian finished with success."
}


# run main function with all the arguments passed to the script
main "$@"