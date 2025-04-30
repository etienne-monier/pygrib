#!/bin/bash

set -euxo pipefail

yum makecache
yum -y install libaec-devel eccodes-devel
