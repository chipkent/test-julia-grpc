# A gRPC client that requests values from the gRPC server.

push!(LOAD_PATH, "/example/julia/gen/")

using Logging
using gRPCClient
import GreetingServiceClients: GreeterBlockingClient, HelloRequest, SayHello

client = GreeterBlockingClient("localhost:11000")

request = HelloRequest(name="Test-$(rand(UInt16))")
@warn("CLIENT-JULIA: Request: $(request.name)")
response, status_future = SayHello(client, request)
gRPCCheck(status_future)
@warn("CLIENT-JULIA: Response: $(response.message)")

