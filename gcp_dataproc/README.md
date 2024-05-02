# Deploy a simple Hadoop cluster on GCP (Dataproc)


## Run

Rename `tmp.env` to `.env` and fill in the fields

Run `./deploy.sh` to deploy the cluster (inspect commands and change flags you want (`--worker-machine-type`, `--num-workers` etc.))

Run `./destroy.sh` to stop and delete the cluster & disable all enabled services
