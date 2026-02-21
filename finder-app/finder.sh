#!/bin/bash

# constants
EXPECTED_ARGS_COUNT=2
ERR_CODE_NO_ERROR=0
ERR_CODE_ARGS_WRONG_COUNT=1
ERR_CODE_DIR_INEXISTENT=1

# check for help option
if [[ $1 == "-h" || $1 == "--help" ]]; then
    echo "Usage: provide a directory to be searched and a string to search for"
    exit $ERR_CODE_NO_ERROR
fi

# check for exactly two args
if [[ $# -ne $EXPECTED_ARGS_COUNT ]]; then
    echo "Expected number of args is ${EXPECTED_ARGS_COUNT} but $# were provided"
    exit $ERR_CODE_ARGS_WRONG_COUNT
fi

DIR=$1
SEARCH_STR=$2

# directory existence check
if [[ ! -d ${DIR} ]]; then
    echo "Provided directory: ${DIR} does not exist"
    exit $ERR_CODE_DIR_INEXISTENT
fi

# count all files
FILES_COUNT=($(find ${DIR} -type f | wc -l))

# count matching lines
MATCHING_LINES=($(grep -R ${SEARCH_STR} ${DIR}| wc -l))
echo "The number of files are ${FILES_COUNT} and the number of matching lines are ${MATCHING_LINES}"