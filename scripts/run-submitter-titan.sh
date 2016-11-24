#!/bin/bash

sleep 25

cd /sources/SparkTitanTests/build/
# Program options.
NUM_SAMPLES=1000

TITAN_LIB_DIR=/opt/titan/lib

#// TODO: Will need to change this when using cluster.
TITAN_CONF="cassandra:titan"

/opt/spark/bin/spark-submit --class "Pi" --driver-memory 6g --master spark://sparkmaster:7077 --jars \
$TITAN_LIB_DIR/titan-core-1.0.0.jar\
,$TITAN_LIB_DIR/commons-configuration-1.10.jar\
,$TITAN_LIB_DIR/commons-lang-2.5.jar\
,$TITAN_LIB_DIR/guava-18.0.jar\
,$TITAN_LIB_DIR/gremlin-core-3.0.1-incubating.jar\
,$TITAN_LIB_DIR/slf4j-api-1.7.5.jar\
,$TITAN_LIB_DIR/slf4j-log4j12-1.7.5.jar\
,$TITAN_LIB_DIR/log4j-1.2.16.jar\
,$TITAN_LIB_DIR/jcl-over-slf4j-1.7.12.jar\
,$TITAN_LIB_DIR/commons-lang3-3.3.1.jar\
,$TITAN_LIB_DIR/titan-cassandra-1.0.0.jar\
,$TITAN_LIB_DIR/cassandra-thrift-2.1.9.jar\
,$TITAN_LIB_DIR/commons-pool-1.6.jar\
,$TITAN_LIB_DIR/cassandra-all-2.1.9.jar\
,$TITAN_LIB_DIR/jackson-mapper-asl-1.9.2.jar\
,$TITAN_LIB_DIR/jackson-core-asl-1.9.2.jar\
,$TITAN_LIB_DIR/jamm-0.3.0.jar\
,$TITAN_LIB_DIR/astyanax-cassandra-3.8.0.jar\
,$TITAN_LIB_DIR/commons-codec-1.7.jar\
,$TITAN_LIB_DIR/hppc-0.7.1.jar\
,$TITAN_LIB_DIR/high-scale-lib-1.0.6.jar\
,$TITAN_LIB_DIR/metrics-core-3.0.1.jar\
,$TITAN_LIB_DIR/commons-collections-3.2.1.jar\
,$TITAN_LIB_DIR/javatuples-1.2.jar\
,$TITAN_LIB_DIR/astyanax-core-3.8.0.jar\
,$TITAN_LIB_DIR/astyanax-thrift-3.8.0.jar\
 ./jars/calculatepititan_2.11-1.0.jar\
 $NUM_SAMPLES\
 $TITAN_CONF