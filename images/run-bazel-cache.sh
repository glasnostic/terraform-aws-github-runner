#!/bin/bash -e

mkdir -p /opt/bazel-cache
chown -R 1000:1000 /opt/bazel-cache
chmod -R 777 /opt/bazel-cache

docker run -u 1000:1000 -v /opt/bazel-cache:/data \
   -p 9090:8080 -p 9092:9092 buchgr/bazel-remote-cache \
   --s3.auth_method=iam_role \
   --s3.bucket=glasnostic-bazel-build-cache --s3.endpoint=s3.us-west-2.amazonaws.com \
   --max_size=150 &