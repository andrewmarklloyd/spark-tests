#!/bin/bash

function cleanup {
  /opt/titan/bin/titan.sh stop
  exit
}

trap "cleanup" SIGTERM SIGINT

/opt/titan/bin/titan.sh start $@

tail -f /opt/titan/log/elasticsearch.log