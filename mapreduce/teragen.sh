#!/usr/bin/env bash


SIZE=25000000 # 2.5 GB - 25m x 100 byte row

hdfs dfs -rm -r -f -skipTrash terainput
yarn jar /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar \
      teragen \
      -Dmapreduce.job.maps=4 \
      $SIZE \
      terainput
