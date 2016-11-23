#!/bin/bash

docker-compose up -d
docker-compose scale spark_slave=5
docker-compose logs --follow