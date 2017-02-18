#!/bin/bash

cd /root/gitiles
bazel clean
bazel build //...

while [ $? != 0 ]; do
    bazel build //...
done

cd /git/repo

/root/gitiles/tools/run_dev.sh /git/gitiles.config
