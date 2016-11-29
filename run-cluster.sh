#!/bin/bash

trap ctrl_c INT

function ctrl_c() {
        echo "* Stopping and removing containers"
        #docker-compose down
        exit 0
}

docker build -t sparktest .
docker-compose up -d
docker-compose scale spark_slave=2
docker-compose logs --follow 

#g = TitanFactory.build().set("storage.backend","cassandra").set("storage.hostname","cassandra").open();