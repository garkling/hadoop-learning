# `Spark` applications via `Zeppelin` notebooks and `spark-submit`

## Run
Set `PROJECT` id in `.env`

Start cluster using `gcp_dataproc/deploy.sh`

Upload `notebooks/*` notebooks by `./upload_notebooks.sh`
- it will go into your cluster staging bucket
- Zeppelin will automatically pull these files


### Notebooks
Go to the cluster 'Web Interfaces' on the GCP console and select `Zeppelin`

Choose a notebook and run (run the 1-st paragraph to create a needed context)

### `spark-submit`
Setup a local Spark development environment or use the cluster's one

Run `spark-submit --deploy-mode <mode> word_count.py <input file/url> <output dir>`
- for local, use `--deploy-mode client` and any text file or download it from `gs://oklev-uku-datasets/text-dataset` as `<input file>`
- for cluster, use `--deploy-mode cluster` and `gs://oklev-uku-datasets/text-dataset` as `<input url>`


#### Restart cluster, if something does not work as expected
