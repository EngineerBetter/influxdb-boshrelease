#!/usr/bin/env bash

set -e

export ROOT_PATH=$PWD

VERSION=$(cat version/number)

cd influxdb-release

cat >> config/private.yml <<EOF
---
blobstore:
  provider: s3
  options:
    access_key_id: "$BLOBSTORE_ACCESS_KEY_ID"
    secret_access_key: "$BLOBSTORE_SECRET_ACCESS_KEY"
EOF

bosh create-release \
  --final \
  --version $VERSION \
  "--tarball=../final-release/influxdb-final-release-${VERSION}.tgz"
