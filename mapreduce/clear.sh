#!/usr/bin/env bash

hdfs dfs -rm -r -f -skipTrash ./ncdc-output
hdfs dfs -rm -r -f -skipTrash ./ncdc-unarchived-output
hdfs dfs -rm -r -f -skipTrash ./terainput
hdfs dfs -rm -r -f -skipTrash ./teraoutput
hdfs dfs -rm -r -f -skipTrash ./wordcount_output
hdfs dfs -rm -r -f -skipTrash ./hadoop.txt
hdfs dfs -rm -r -f -skipTrash /data
rm -rf ~/ncdc
