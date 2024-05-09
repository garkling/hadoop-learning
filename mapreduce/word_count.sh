#!/usr/bin/env bash
set -a

. .env

OUTPUT_DIR=wordcount_output

# from the your local machine
gsutil -m cp hadoop.txt gs://"$PROJECT"-staging/

hdfs dfs -cp gs://"$PROJECT"-staging/hadoop.txt .

hdfs dfs -rm -r -f -skipTrash "$OUTPUT_DIR"
yarn jar /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar \
      wordcount \
      -Dmapreduce.job.reduces=1 \
      hadoop.txt \
      "$OUTPUT_DIR"

hdfs dfs -ls "$OUTPUT_DIR"
hdfs dfs -cat "$OUTPUT_DIR"/* | less
