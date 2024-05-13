#!/usr/bin/env bash
set -a

. .env
gsutil -m cp notebooks/* gs://"$PROJECT"-staging/notebooks/zeppelin/
