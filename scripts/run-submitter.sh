#!/bin/bash

sleep 25 && /opt/spark/bin/spark-submit --class "Pi" --driver-memory 6g --master spark://sparkmaster:7077 /sources/SparkTitanTests/build/jars/calculatepi_2.11-1.0.jar 1000000