#!/bin/bash

#
# This is a small utility script to check if an application is currently running.
#
# NOTE: this script IS case sensitive (for better precision). If you need
#       fuzzier matching, partial app names will also work!
#
# Example usage:       `./is-app-running.sh Dropbox`
# Example fuzzy usage: `./is-app-running.sh Plex`    (this will match "Plex Media Server")
#

PROCESS=$1
number=$(ps aux | grep $PROCESS | grep -v grep | grep -v "bin/bash" | wc -l)
# `grep -v foo` tells grep to filter out lines containing the string "foo" from
# the output (so here we want to ignore our call to grep as well as our calling
# of this script)

if [ $number -gt 0 ]; then
  echo 1
else
  echo 0
fi


#
# By the way, this entire script can be done in one line using pgrep:
#   `if pgrep -q Dropbox; then ... fi`
#
