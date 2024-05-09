#!/usr/bin/env bash

DATA_DIR="ncdc_input"
DATA_PATH="/data/$DATA_DIR"

# under your user
gsutil -m cp -r gs://oklev-uku-datasets/ncdc ~

hdfs dfs -mkdir -p "$DATA_PATH"
hdfs dfs -chown -R "$USER:$USER" "$DATA_PATH"
hdfs dfs -chmod -R 777 "$DATA_PATH"

hdfs dfs -put ~/ncdc/* "$DATA_PATH"/

hdfs dfs -ls /data/
hdfs dfs -ls "$DATA_PATH"

hdfs dfs -rm -r -f -skipTrash /data
rm -rf /home/"$USER"/ncdc
