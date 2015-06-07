#!/bin/bash

set -e
set -x

apt-get update
apt-get install --no-install-recommends -y ca-certificates curl

curl --silent --show-error --location https://prosody.im/files/prosody-debian-packages.key | sudo apt-key add -
echo deb http://packages.prosody.im/debian $(lsb_release -sc) main > /etc/apt/sources.list.d/prosody.list

apt-get update
# lua-sec is needed for TLS
# lua-bitop is needed for mod_websocket
# lua-event for libevent back-end
apt-get install --no-install-recommends -y prosody lua-sec lua-bitop lua-event

# Needed until Prosody 0.10 is released
curl --silent --show-error --location https://prosody-modules.googlecode.com/hg-history/e87678a527202cf12631983abfe5ab307e3ee468/mod_websocket/mod_websocket.lua > /usr/lib/prosody/modules/mod_websocket.lua

rm -rf /var/lib/apt/lists/*
