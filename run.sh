#!/bin/bash
# run.sh
# Lucas Combs
# 16 August 2018
# github.com/lcombs15

# Start factorio server

# Append two empty lines and current datetime to server log
echo -e "\n" $(date) >> server_log.txt

# Start server in background
nohup ./server_exe/bin/x64/factorio --start-server saves/squad.zip >> server_log.txt &
