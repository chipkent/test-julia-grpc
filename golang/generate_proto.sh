#!/bin/bash

# Generate Go from proto files.
# Generates greeter.pb.go and greeter_grpc.pb.go

OUTPUT_DIR=/example/golang/greetingservice
rm -rf ${OUTPUT_DIR}
mkdir -p ${OUTPUT_DIR}

protoc --proto_path=/example/proto --go_out=${OUTPUT_DIR} --go_opt=paths=source_relative --go-grpc_out=${OUTPUT_DIR} --go-grpc_opt=paths=source_relative greeter.proto
