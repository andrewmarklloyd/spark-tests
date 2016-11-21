#!/bin/bash

# Test spark
cd /sources/SparkTitanTests/build/ && ./bin/calculatePi.sh 100

# Test with titan
/opt/titan/bin/titan.sh start
cd /sources/SparkTitanTests/build/ &&
./bin/calculatePiTitan.sh 100