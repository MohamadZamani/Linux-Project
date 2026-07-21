#!/bin/bash

# Define variables
SOURCE_DIR="/var/www/html/news"
ARCHIVE_NAME="xfusioncorp_news.zip"
LOCAL_DEST="/archives"
REMOTE_USER="natasha"
REMOTE_HOST="ststor01"
REMOTE_DEST="/archives"

# Step a, b & c: Zip directory and only execute SCP if zip succeeds (Exit Code 0)
zip -r "${LOCAL_DEST}/${ARCHIVE_NAME}" "${SOURCE_DIR}" && \
scp "${LOCAL_DEST}/${ARCHIVE_NAME}" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DEST}/"
