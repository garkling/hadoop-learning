#!/usr/bin/env bash
set -a

. .env


gcloud services enable dataproc.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com

# restrict the `default` network ingress on the SSH 22 port to only the client public ip
gcloud compute firewall-rules update default-allow-ssh \
        --source-ranges="$CLIENT_IP" \
        --project="$PROJECT"

# grand the default service account permissions to operate with the Dataproc cluster
gcloud projects add-iam-policy-binding "$PROJECT" \
        --member=serviceAccount:"$(gcloud projects describe "$PROJECT" --format='value(projectNumber)')"-compute@developer.gserviceaccount.com \
        --role=roles/dataproc.worker \
        --format='json(bindings[2])'

# create a staging bucket
gcloud storage buckets create gs://"$PROJECT"-staging \
        --project="$PROJECT" \
        --default-storage-class=STANDARD \
        --location="$REGION" \
        --uniform-bucket-level-access

gcloud dataproc clusters create "$CLUSTER_NAME" \
        --enable-component-gateway \
        --public-ip-address \
        --scopes 'https://www.googleapis.com/auth/cloud-platform' \
        --region "$REGION" \
        --master-machine-type e2-standard-4 \
        --master-boot-disk-type pd-balanced \
        --master-boot-disk-size 100 \
        --num-workers 2 \
        --worker-machine-type e2-standard-4 \
        --worker-boot-disk-type pd-balanced \
        --worker-boot-disk-size 200 \
        --image-version 2.2-debian12 \
        --optional-components ZEPPELIN \
        --project "$PROJECT" \
        --bucket "$PROJECT"-staging

gcloud compute ssh "$CLUSTER_NAME"-m \
        --zone "$(gcloud compute instances list --project "$PROJECT" --filter="name=$CLUSTER_NAME-m" --format="value(zone)")" \
        --project "$PROJECT"
