FROM julia:1.7.2

RUN apt update -y && \
    apt install -y procps git golang-go protobuf-compiler protoc-gen-go && \
    go get google.golang.org/grpc/cmd/protoc-gen-go-grpc && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc && \
    cp /root/go/bin/protoc-gen-go-grpc /usr/bin
    
COPY ./setup.jl /

RUN julia /setup.jl

