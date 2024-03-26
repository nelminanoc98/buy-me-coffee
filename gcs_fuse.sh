#!/bin/bash

# Replace [YOUR_BUCKET_NAME] with your actual GCS bucket name
BUCKET_NAME="buy-me-coffee-public"

# Replace [YOUR_KEY_FILE.json] with the path to your service account key file
KEY_FILE="gcs_key.json"

# Mount the GCS bucket to /mnt/gcs
gcsfuse --implicit-dirs $BUCKET_NAME /mnt/gcs --key-file $KEY_FILE

# Your main application command goes here
# For example:
# exec "$@"
