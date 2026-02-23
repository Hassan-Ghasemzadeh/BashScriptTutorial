#!/usr/bin/env bash


# -e: (errexit) Exit immediately if a command exits with a non-zero status.
# -u: (nounset) Treat unset variables as an error when substituting.
# -o pipefail: The return value of a pipeline is the status 
# of the last command to exit with a non-zero status, or zero if no command exited with a non-zero status.
set -euo pipefail


IFS=$'\n\t'