#!/bin/bash
set -o xtrace


#
# Install TailScale
#

curl -fsSL https://tailscale.com/install.sh | sh
tailscale up

