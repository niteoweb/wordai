#!/bin/bash

function handle_exit {
    if [ $? -ne 0 ]; then
        EXITCODE=1
    fi
}

EXITCODE=0

echo '====== Running tests ========='
bin/test -s wordai; handle_exit

echo '======== Running vvv ========='
bin/vvv src/wordai; handle_exit
bin/vvv setup.py; handle_exit

if [ $EXITCODE -ne 0 ]; then
    exit 1
fi