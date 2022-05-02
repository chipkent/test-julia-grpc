#!/bin/sh

# Create a bash shell on a docker container with all necessary packages installed.

docker build -t test-julia-grpc .
docker run -v "$(pwd)":/example -it test-julia-grpc /bin/bash