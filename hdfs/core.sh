#!/usr/bin/env bash

# under hdfs user
sudo -E su hdfs -c "hdfs dfs -mkdir -p /user/$USER"
sudo -E su hdfs -c "hdfs dfs -chown -R $USER:$USER /user/$USER"
sudo -E su hdfs -c "hdfs dfs -chmod -R 744 /user/$USER"

# under your user
# copy from host to HDFS
hdfs dfs -put /etc/hadoop/conf/core-site.xml /user/"$USER"/

# browse methods
hdfs dfs -ls -h hdfs:///user/"$USER"/
hdfs dfs -ls -h /user/"$USER"/
hdfs dfs -ls -h .

# copy from HDFS to host
hdfs dfs -get /tmp /home/"$USER"

# set replication/blocksize
hdfs dfs -setrep 3 core-site.xml
hdfs dfs -D dfs.blocksize=67108864 -put /etc/hadoop/conf/hdfs-site.xml hdfs-site.xml

# show files stat
hdfs dfs -stat "%b %o %r %y %n" -- *site.xml

hdfs dfs -find / -name -- *site.xml
hdfs dfs -rm -r -f -skipTrash -- *-site.xml
