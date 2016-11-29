#!/bin/bash

docker-compose up -d
docker-compose scale spark_slave=3
docker-compose logs --follow
