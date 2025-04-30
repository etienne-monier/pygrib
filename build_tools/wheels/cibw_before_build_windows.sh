#!/bin/bash

set -euxo pipefail

AEC_VERSION=1.1.3
ECCODES_VERSION=2.41.0
ECCODES_DIR=/usr/local

mkdir /dependencies

# LIBAEC INSTALLATION
#

# mkdir /dependencies/aec
# cd /dependencies/aec

# # Get Source code
# STEM="libaec-v${AEC_VERSION}"
# curl https://gitlab.dkrz.de/k202009/libaec/-/archive/v${AEC_VERSION}/${STEM}.tar.gz \
#   --output ${STEM}.tar.gz
# tar -xf "${STEM}.tar.gz"

# # Build and install
# mkdir build
# cd build
# cmake -DCMAKE_INSTALL_PREFIX=${ECCODES_DIR} ../${STEM}

# ls

# make install

# ECCODES INSTALLATION
#

mkdir /dependencies/eccodes
cd /dependencies/eccodes

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
