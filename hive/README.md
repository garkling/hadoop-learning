# `Hive` queries via `Zeppelin` notebooks

## Run
Set `PROJECT` id in `.env`

Start cluster using `gcp_dataproc/deploy.sh`

Upload `notebooks/*` notebooks by `./upload_notebooks.sh`
- it will go into your cluster staging bucket
- Zeppelin will automatically pull these files

Go to the cluster 'Web Interfaces' on the GCP console and select `Zeppelin`

Choose a notebook and run (there is a dependency between paragraphs, but not for all)

Restart cluster, if something does not work as expected
