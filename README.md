
### Requirements
- docker v1.12
- docker-compose v1.8

### Basic usage
- Run ./calc-pi.sh to bring up the Spark master node, 5 Spark worker nodes, and one Spark utility node to submit the Calculate Pi job to the master
- Spark master node will have a web UI accessible at http://<docker-ip>:8080 that will give details of registered nodes and jobs. IP address of docker container will vary by configuration but will generally be accessible on localhost

### Current Workarounds
- Setup is only for running multiple nodes on single machine. Support for multi-machine/multi-node in progress
- Master and worker nodes require an additional command (tailing log file) to keep the container alive because starting spark in standalone runs as daemon and docker container will not keep itself alive
- Worker node requires 5 second delay on startup to wait for master node initialization
- Utility node requires 25 second delay before submitting job to wait for all worker nodes to initialize

### Use with Titan DB (Not implemented yet)
- In progress