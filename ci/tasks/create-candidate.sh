#!/usr/bin/env bash

set -e

export ROOT_PATH=$PWD

cd influxdb-release

bosh create-release --tarball=../release/influxdb-dev-release.tgz --timestamp-version --force
