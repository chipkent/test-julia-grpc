// A gRPC server that replies to gRPC clients.

package main

import (
	"context"
	"fmt"
	"log"
	"net"

	"google.golang.org/grpc"

	gs "deephaven.io/test-julia-grpc/greetingservice"
)

// Server implementation
type GreeterServer struct {
	gs.UnimplementedGreeterServer
}

// gRPC method implementation
func (GreeterServer) SayHello(context context.Context, request *gs.HelloRequest) (*gs.HelloReply, error) {
	log.Printf("SERVER-GO: SayHello request: name=%s", request.Name)
	message := fmt.Sprintf("Go server got your message: name=%s", request.Name)
	return &gs.HelloReply{Message: message}, nil
}

func main() {
	log.Printf("SERVER-GO: Starting")
	defer log.Printf("SERVER-GO: Exiting")

	lis, err := net.Listen("tcp", "localhost:11000")
	if err != nil {
		log.Fatalf("SERVER-GO: Failed to listen: %v", err)
	}

	grpcServer := grpc.NewServer()
	gs.RegisterGreeterServer(grpcServer, &GreeterServer{})
	grpcServer.Serve(lis)
}