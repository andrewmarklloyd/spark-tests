#!/bin/bash


sleep 5
/opt/spark/sbin/start-slave.sh spark://sparkmaster:7077
tail -f `find /opt/spark/logs/ -name spark*`