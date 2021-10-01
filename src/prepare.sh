#!/bin/bash

set -x

if [ "$EXTRA_APT_PACKAGES" ]; then
    echo "EXTRA_APT_PACKAGES environment variable found.  Installing."
    apt update -y
    apt install -y $EXTRA_APT_PACKAGES
fi

if [ "$EXTRA_PIP_PACKAGES" ]; then
    echo "EXTRA_PIP_PACKAGES environment variable found.  Installing".
    pip install $EXTRA_PIP_PACKAGES
fi

exec "$@"
