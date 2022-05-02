#!/bin/sh

docker build -t test-julia-grpc .

# docker run -it test-julia-grpc
docker run -v "$(pwd)":/example -it test-julia-grpc /bin/bash