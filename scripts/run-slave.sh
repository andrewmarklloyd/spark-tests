#!/bin/bash


## spark_master hostname not recognized. Must use sparkmaster without underscore.
## it's not recognized for spark master url
sleep 5 && /opt/spark/sbin/start-slave.sh spark://sparkmaster:7077 && tail -f `find /opt/spark/logs/ -name spark*`