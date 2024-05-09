#!/usr/bin/env bash


gsutil cp gs://oklev-uku-datasets/applications/hadoop-examples.jar ~

# archived data
# run commands to load ncdc data from hdfs/load_ncdc.sh
hdfs dfs -rm -r -f -skipTrash ncdc-output
yarn jar hadoop-examples.jar \
      MaxTemperature \
      /data/ncdc_input \
      ncdc-output

# or directly from the GCS
hdfs dfs -rm -r -f -skipTrash ncdc-output
yarn jar hadoop-examples.jar \
      MaxTemperature \
      gs://oklev-uku-datasets/ncdc \
      ncdc-output

# note that the ncdc_input contains archives in the GZIP format which is not splittable, hence # of files == # of mappers regardless of size

hdfs dfs -ls ncdc-output/
hdfs dfs -cat ncdc-output/*

# unarchived data
gunzip ~/ncdc/*.gz

hdfs dfs -mkdir -p /data/ncdc-input-unarchived/
hdfs dfs -chown -R "$USER:$USER" /data/ncdc-input-unarchived/
hdfs dfs -put ~/ncdc/* /data/ncdc-input-unarchived/

hdfs dfs -rm -r -f -skipTrash ncdc-unarchived-output
yarn jar hadoop-examples.jar \
      MaxTemperature \
      /data/ncdc-input-unarchived \
      ncdc-unarchived-output

# compare time elapsed and mappers amount

hdfs dfs -ls ncdc-unarchived-output/
hdfs dfs -cat ncdc-unarchived-output/*
