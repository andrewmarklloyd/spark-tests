#!/bin/bash

programname=$0

function usage() {
    echo "Usage: $programname"
    echo "  --local     run 3 slave nodes locally without Titan integration to calculate pi and tail logs"
    echo ""
    echo "  --cluster   run "
    exit 1
}

function runlocal() {
	trap ctrl_c INT
	ctrl_c() {
		echo "Shutting down containers"
		docker-compose down
	}
	docker-compose up -d
	docker-compose scale spark_slave=3
	docker-compose logs --follow

}

runcluster() {
	echo 'not implemented'
}

case $1 in
	"--local" )
		runlocal;;
	"--cluster" )
		runcluster;;
	*)
		usage
esac

