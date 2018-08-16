#!/bin/bash

# status.sh
# Lucas Combs
# 16 August 2018
# github.com/lcombs15
# Print a litte report about the server

# Wipe console for easy reading
clear

# Display most recent logs entries
tail *_log.txt && echo

# Tell user about newest save file
./newest_file.sh && echo

# Display current running PID (empty if not running)
echo Current PID: $(pidof factorio)
