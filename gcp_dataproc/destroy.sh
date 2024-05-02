#!/usr/bin/env bash
set -a

. .env


gcloud dataproc clusters delete "$CLUSTER_NAME" --region "$REGION" --project "$PROJECT"
gcloud storage rm -r gs://"$PROJECT"-staging

gcloud services disable dataproc.googleapis.com
gcloud services disable cloudresourcemanager.googleapis.com
