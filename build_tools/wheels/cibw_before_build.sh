#!/bin/bash

set -euxo pipefail

ECCODES_VERSION=2.41.0
ECCODES_DIR=/usr/local
cat /etc/*-release
apt-get install libaec-dev

# ECCODES INSTALLATION
#

# Get Source code
STEM="eccodes-${ECCODES_VERSION}-Source"
curl https://confluence.ecmwf.int/download/attachments/45757960/${STEM}.tar.gz\?api\=v2 \
  --output ${STEM}.tar.gz
tar -xf "${STEM}.tar.gz"

# Build and install
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${ECCODES_DIR} ../${STEM}
make
make install
