#!/bin/bash

BAZEL_RELEASE_VER=0.4.4


mkdir build

cd build

function bazel() {
    wget https://github.com/bazelbuild/bazel/releases/download/${BAZEL_RELEASE_VER}/bazel-${BAZEL_RELEASE_VER}-dist.zip
    rm -rf bazel
    mkdir bazel
    cd bazel && unzip ../bazel-${BAZEL_RELEASE_VER}-dist.zip
    sed -i 's/-source ${JAVA_VERSION} -target ${JAVA_VERSION}//g' scripts/bootstrap/bootstrap.sh
    sed -i 's/-source ${JAVA_VERSION} -target ${JAVA_VERSION}//g' scripts/bootstrap/compile.sh
    sed -i 's/-source "$JAVA_VERSION" -target "$JAVA_VERSION"//g' scripts/bootstrap/compile.sh
    sed -i 's/-source "$JAVA_VERSION" -target "$JAVA_VERSION"//g' scripts/bootstrap/bootstrap.sh
    sed -i '/get_java_version/{n;d}' scripts/bootstrap/compile.sh
    sed -i '/get_java_version/{n;d}' scripts/bootstrap/compile.sh
    cd ../../
    docker build -f bazel_build.dockerfile -t bazel-build .
    docker run -it --rm -v $PWD/build/bazel:/bazel bazel-build /bazel/compile.sh
    cd build
}

function gitiles() {
    git clone --depth 1 https://gerrit.googlesource.com/gitiles
    cd ../
    docker build -f gitiles.dockerfile -t gitiles .
    cd build
}

bazel

gitiles

cd ..
