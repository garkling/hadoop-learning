#!/usr/bin/env bash

DATA_DIR="movie_ratings_dataset"
DATA_PATH="/user/$USER/$DATA_DIR"

# under your user
gsutil cp gs://oklev-uku-datasets/movie-ratings/ml-25m.zip /home/"$USER"
unzip /home/"$USER"/ml-25m.zip && rm /home/"$USER"/ml-25m.zip

hdfs dfs -mkdir -p "$DATA_PATH"

hdfs dfs -put /home/"$USER"/ml-25m/* "$DATA_PATH"/
hdfs dfs -test -e "$DATA_PATH"/movies.csv && echo "$DATA_PATH/movies.csv exists"

hdfs dfs -mkdir -p "$DATA_PATH"1
hdfs dfs -cp "$DATA_PATH"/movies.csv "$DATA_PATH"1/
hdfs dfs -ls "$DATA_PATH"*/*

hdfs dfs -rm -r -f -skipTrash "$DATA_PATH"*/*
rm -rf /home/"$USER"/ml-25m
