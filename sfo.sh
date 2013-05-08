#!/bin/bash

## Starts a node in the SFO site

if [ $# -eq 0 ]
then
  echo "Usage: `basename $0` <node name> [<bind address> <port offset>]"
  exit $E_BADARGS
fi

## Change config below for different sites
SITE=SFO
CONFIG=sfo.xml
MCAST_ADDR=239.3.3.3
## Change


NODE_NAME=$1
BIND_ADDR=$2
PORT_OFFSET=$3
: ${BIND_ADDR:="127.0.0.1"}
: ${PORT_OFFSET:="0"}

echo "name is $NODE_NAME"
echo "bind address is $BIND_ADDR"
echo "port offset is $PORT_OFFSET"

./standalone.sh -c $CONFIG -Dsite=$SITE -b $BIND_ADDR -Djboss.node.name=$NODE_NAME \
                -Djboss.socket.binding.port-offset=$PORT_OFFSET -u $MCAST_ADDR

