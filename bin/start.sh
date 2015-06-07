#!/bin/bash

DATADIR=/var/lib/prosody

usage() {
    echo "Usage:" 2>&1
    echo "" 2>&1
    echo "shell        -- Start an interactive shell" 2>&1
    echo "rootshell    -- Start an interactive root shell" 2>&1
    echo "prosody      -- Start prosody XMPP server" 2>&1
}

case $1 in
    "shell")
        cd $DATADIR
        exec runas prosody /bin/bash
        ;;
    "rootshell")
        exec /bin/bash
        ;;
    "prosody")
        chown prosody:prosody $DATADIR
        cd $DATADIR
        exec runas prosody prosody
        ;;
    *)
        usage
        exit 1
        ;;
esac
