#!/bin/bash


/opt/spark/sbin/start-master.sh
tail -f `find /opt/spark/logs/ -name spark*`