# test-julia-grpc
This repository provides an example of how to do gRPC in Julia.

1. [gRPCClient](https://github.com/JuliaComputing/gRPCClient.jl) is used, since it has some documentation.
2. [gRPCClient](https://github.com/JuliaComputing/gRPCClient.jl) only supports gRPC clients in Julia.
3. If a gPRC server in Julia is needed, consider [gRPC](https://github.com/tanmaykm/gRPC.jl), which has zero documentation.  Please create a PR to add the example here.
4. To provide a gRPC server to test with, one is implemented in Go.

# How to run things

To get a stable and portable development environment for this work, Docker is used.  To start this environment, run:

```bash
./run.sh
```

This will give you a bash shell in a Docker container with all of the necessary packages installed.  Obviously, you will need Docker installed for this to work.

All following commands are to be run in the container.

# How to generate gRPC code from proto files

This should not be necessary, unless you change the proto files.

## Go

```bash
/example/golang/generate_proto.sh
```

The generated files are stored in [./golang/greetingservice/](./golang/greetingservice/).
## Julia

```bash
julia /example/julia/generate_proto.jl
```

The generated files are stored in [./julia/gen/](./julia/gen/).

# Start the Go gRPC server

```bash
cd /example/golang
go run server.go &
```

# Stop the Go gRPC server

```bash
killall server
```
# Run the Go gRPC client

```bash
cd /example/golang
go run client.go
```

# Run the Julia gRPC client

```bash
julia /example/julia/client.jl
```