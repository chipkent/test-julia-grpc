module GreetingServiceClients
using gRPCClient

include("GreetingService.jl")
using .GreetingService

import Base: show

# begin service: GreetingService.Greeter

export GreeterBlockingClient, GreeterClient

struct GreeterBlockingClient
    controller::gRPCController
    channel::gRPCChannel
    stub::GreeterBlockingStub

    function GreeterBlockingClient(api_base_url::String; kwargs...)
        controller = gRPCController(; kwargs...)
        channel = gRPCChannel(api_base_url)
        stub = GreeterBlockingStub(channel)
        new(controller, channel, stub)
    end
end

struct GreeterClient
    controller::gRPCController
    channel::gRPCChannel
    stub::GreeterStub

    function GreeterClient(api_base_url::String; kwargs...)
        controller = gRPCController(; kwargs...)
        channel = gRPCChannel(api_base_url)
        stub = GreeterStub(channel)
        new(controller, channel, stub)
    end
end

show(io::IO, client::GreeterBlockingClient) = print(io, "GreeterBlockingClient(", client.channel.baseurl, ")")
show(io::IO, client::GreeterClient) = print(io, "GreeterClient(", client.channel.baseurl, ")")

import .GreetingService: SayHello
"""
    SayHello

- input: GreetingService.HelloRequest
- output: GreetingService.HelloReply
"""
SayHello(client::GreeterBlockingClient, inp::GreetingService.HelloRequest) = SayHello(client.stub, client.controller, inp)
SayHello(client::GreeterClient, inp::GreetingService.HelloRequest, done::Function) = SayHello(client.stub, client.controller, inp, done)

# end service: GreetingService.Greeter

end # module GreetingServiceClients
