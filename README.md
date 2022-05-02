# test-julia-grpc
Test gRPC with Julia

https://github.com/JuliaComputing/gRPCClient.jl

```bash
julia /example/julia/generate_proto.jl
/example/golang/generate_proto.sh
```

```bash
cd /example/golang
go run server.go &
go run client.go
```