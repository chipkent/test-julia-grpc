// A gRPC client that requests values from the gRPC server.

package main

import (
    "context"
	"fmt"
    "log"
    "time"
	"math/rand"

    "google.golang.org/grpc"
	gs "deephaven.io/test-julia-grpc/greetingservice"
)

// Make an RPC call
func makeRPC(client gs.GreeterClient) {
	name := fmt.Sprintf("Name-%v", rand.Int())
	log.Printf("CLIENT: Calling makeRPC for name=\"%s\"", name)
    ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
    defer cancel()

	request := &gs.HelloRequest{Name: name}
	log.Printf("CLIENT: Request: %v", request)
	response, err := client.SayHello(ctx, request)

    if err != nil {
        log.Fatalf("CLIENT: %v.SayHello(_) = _, %v: ", client, err)
    }

	log.Printf("CLIENT: Response: %s", response.Message)
}

func main() {

    conn, err := grpc.Dial("localhost:11000", grpc.WithInsecure())

    if err != nil {
        log.Fatalf("CLIENT: Failed to dial: %v", err)
    }
    defer conn.Close()

    client := gs.NewGreeterClient(conn)

	makeRPC(client)
}
