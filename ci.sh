#!/usr/bin/env bash

set -e

export TZ=Asia/Kolkata

USER="cyberknight777"
MAIL="cyberknight755@gmail.com"
ORG="cyberknight777"
BRANCH="master"

if [ "$1" = "--arm64" ]; then
    ARCH="arm64"
    TARGET="aarch64-elf"
elif [ "$1" = "--arm" ]; then
    ARCH="arm"
    TARGET="arm-eabi"
fi

git config --global user.name ${USER}
git config --global user.email ${MAIL}

git clone https://${USER}:${GITHUB_TOKEN}@github.com/${ORG}/gcc-${ARCH} ../gcc-${ARCH} -b ${BRANCH} --depth=1
rm -rf ../gcc-${ARCH}/*

chmod a+x *.sh
./build-gcc.sh -a ${ARCH}
./build-lld.sh -a ${ARCH}

script_dir=$(pwd)
cd ../gcc-${ARCH}

./bin/${TARGET}-gcc -v 2>&1 | tee /tmp/gcc-version
./bin/${TARGET}-ld.lld -v 2>&1 | tee /tmp/lld-version

git add . -f
git commit -as -m "EvaGCC: Import ${ARCH} GCC $(/bin/date -u "+%Y%m%d")" -m "Build completed on: $(/bin/date)" -m "Configuration: $(/bin/cat /tmp/gcc-version)" -m "LLD: $(/bin/cat /tmp/lld-version)"
git push -f
