FROM julia:1.7.2

RUN apt update -y && \
    apt install -y golang-go protobuf-compiler
    
COPY ./setup.jl /

RUN julia /setup.jl

