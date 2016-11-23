#!/bin/bash

/opt/titan/bin/titan.sh start && tail -f `find /opt/titan/logs/ -name titan*`