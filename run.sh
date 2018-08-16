echo >> server_log.txt
echo >> server_log.txt
echo $(date) >> server_log.txt

nohup ./server_exe/bin/x64/factorio --start-server saves/squad.zip >> server_log.txt &

exit 0
