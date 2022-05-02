using Pkg
Pkg.add("ProtoBuf")
Pkg.add("gRPCClient")

using gRPCClient
gRPCClient.generate("greeter.proto")
