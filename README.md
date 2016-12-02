### Requirements
- docker v1.12
- docker-compose v1.8

### Basic usage
- `./calc-pi.sh --local` Run 3 slave nodes locally without Titan integration to calculate pi and tail logs. Ctrl c will shutdown containers and show result of Pi
- Spark master node will have a web UI accessible at `http://<docker-ip>:8080` that will give details of registered nodes and jobs. IP address of docker container will vary by configuration but will generally be accessible on localhost

### Current Workarounds
- Setup is only for running multiple nodes on single machine. Support for multi-machine/multi-node in progress
- Master and worker nodes require an additional command (tailing log file) to keep the container alive because starting spark in standalone runs as daemon and docker container will not keep itself alive
- Worker node requires 5 second delay on startup to wait for master node initialization
- Utility node requires 25 second delay before submitting job to wait for all worker nodes to initialize

### Use with Titan DB (Partially implemented)
- `./calc-pi.sh --local-titan` Run 3 slave nodes with Titan integration to calculate pi and tail logs. Ctrl c will shutdown containers and show result of Pi
- Connects remotely to distributed cassandra database via Titan
- Implementing remote elastic search container now
    - Lack of elasticsearch implementation results in extremly slow run time. Time will be reduced dramatically after elasticsearch implementation

### Use with Titan DB distributed (Not Implemented)
- `./calc-pi.sh --cluster-titan`