#!/usr/bin/env sh

help() {
  echo "Usage: ${0} <image> <tag> [<target tag>]"
}

if [ -z "$1" ] ; then
        echo "Missing image name"
        help
        exit 1
fi

if [ -z "$2" ] ; then
        echo "Missing image tag"
        help
        exit 1
fi

if [ -z "$3" ] ; then
	TARGET_TAG=$2
else
	TARGET_TAG=$3
fi

BASEDIR="$(dirname $0)"

echo "Run update.sh ${2}"
sh ${BASEDIR}/update.sh $2

if [ $? -ne 0 ]; then
  echo "Build failed"
  exit 1
fi

echo "Run docker build -t ${1}:${TARGET_TAG} ${BASEDIR}"
docker build -t ${1}:${TARGET_TAG} ${BASEDIR}

echo "Update image on docker HUB"
docker push docker.io/${1}:${TARGET_TAG}