#!/usr/bin/env bash

sudo -E su hdfs -c "hdfs dfsadmin -allowSnapshot /user/$USER"

hdfs dfs -createSnapshot /user/"$USER" snap1
hdfs dfs -ls /user/"$USER"/.snapshot/snap1

sudo -E su hdfs -c "hdfs dfsadmin -disallowSnapshot /user/$USER"
hdfs dfs -deleteSnapshot /user/"$USER" snap1
sudo -E su hdfs -c "hdfs dfsadmin -disallowSnapshot /user/$USER"
