#!/bin/bash

programname=$0

function usage() {
    echo "Usage: $programname"
    echo "  --local           Run 3 slave nodes locally without Titan integration to calculate pi and tail logs"
    echo "                    Ctrl c will shutdown containers and show result of Pi"
    echo ""
    echo "  --local-titan     Run 3 slave nodes with Titan integration to calculate pi and tail logs"
    echo "                    Ctrl c will shutdown containers and show result of Pi"
    echo ""
    echo "  --cluster-titan         run "
    exit 1
}

function dockerLocal() {
	docker-compose -f local/docker-compose.yml "$@"
}

function dockerLocalTitan() {
	docker-compose -f localTitan/docker-compose.yml "$@"
}

function runlocal() {
	docker build -t andrew_sparktest .
	trap ctrl_c INT
	ctrl_c() {
		echo "Shutting down containers"
		dockerLocal logs spark_util | grep 'Pi is roughly'
		dockerLocal down
	}
	dockerLocal up -d
	dockerLocal scale spark_slave=3
	dockerLocal logs --follow
}

function runlocalTitan() {
	docker build -t andrew_sparktest .
	trap ctrl_c INT
	ctrl_c() {
		echo "Shutting down containers"
		dockerLocalTitan logs spark_util | grep 'Pi is roughly'
		dockerLocalTitan down
	}
	dockerLocalTitan up -d
	dockerLocalTitan scale spark_slave=3
	dockerLocalTitan logs --follow	
}

runclusterTitan() {
	echo 'Not implemented yet'
}

case $1 in
	"--local" )
		runlocal;;
	"--local-titan" )
		runlocalTitan;;
	"--cluster-titan" )
		runclusterTitan;;
	*)
		usage
esac

