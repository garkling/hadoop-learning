#!/usr/bin/env bash

# under hdfs user
# for name node
USER="<user> or hdfs"
hdfs fsck /
hdfs fsck /user/"$USER" -files
hdfs fsck /user/"$USER" -files -blocks
hdfs dfsadmin -report

hdfs getconf -confKey dfs.namenode.name.dir

systemctl status hadoop-hdfs-namenode.service
systemctl stop hadoop-hdfs-namenode.service

hdfs fsck /

systemctl start hadoop-hdfs-namenode.service


# for data node
hdfs getconf -confKey dfs.datanode.data.dir

systemctl status hadoop-hdfs-datanode.service
systemctl stop hadoop-hdfs-datanode.service

hdfs fsck /

systemctl start hadoop-hdfs-datanode.service
