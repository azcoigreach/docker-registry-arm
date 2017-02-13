#!/usr/bin/env sh

if [ $# -eq 0 ] ; then
        echo "Usage: ./build.sh <image name>"
        exit
fi

IMAGE=$1

echo "Image ${IMAGE}"

echo "Run update.sh master"
sh update.sh master

echo "Run docker build -t ${IMAGE} ."
docker build -t ${IMAGE} .