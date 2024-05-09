#!/usr/bin/env bash


yarn jar /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar \
      terasort \
      -Dmapreduce.job.reduces=1 \
      terainput \
      teraoutput
