#!/bin/bash

# constants
EXPECTED_ARGS_COUNT=2
ERR_CODE_NO_ERROR=0
ERR_CODE_ARGS_WRONG_COUNT=1
ERR_CODE_DIR_INEXISTENT=1
ERR_CODE_FILE_CREATION_FAILURE=2

# check for help option
if [[ $1 == "-h" || $1 == "--help" ]]; then
    echo "Usage: provide a full path to file including filename to be written and a string to write"
    exit $ERR_CODE_NO_ERROR
fi

# check for exactly two args
if [[ $# -ne $EXPECTED_ARGS_COUNT ]]; then
    echo "Expected number of args is ${EXPECTED_ARGS_COUNT} but $# were provided"
    exit $ERR_CODE_ARGS_WRONG_COUNT
fi

FULL_FILENAME=$1
DIR=(${FULL_FILENAME%/*})
STR=$2

mkdir -p ${DIR}
# file existence check
if [[ ! -f ${FULL_FILENAME} ]]; then
    touch ${FULL_FILENAME}
    FILE_CREATION_RC=$?
    if [[ FILE_CREATION_RC -ne 0 ]]; then
        echo "File creation failed: ${FILE_CREATION_RC}"
        exit $ERR_CODE_FILE_CREATION_FAILURE
    fi
fi

echo ${STR} > ${FULL_FILENAME}