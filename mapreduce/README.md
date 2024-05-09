# `MapReduce` applications

## Run
Set `PROJECT` id in `.env`

Start cluster using `gcp_dataproc/deploy.sh`

Run commands from shell scripts in the master node under your `$USER`

## Application classes
- `wordcount` - count number of words occurring in text files
- `teragen` - generate random files in HDFS
- `terasort` - sort generated files for cluster benchmarking
- `maxTemperature` - get max temperature by year from the NCDC data
