
using gRPCClient
gen_dir = "/example/client/gen"
rm(gen_dir; recursive=true, force=true)
mkpath(gen_dir)
gRPCClient.generate("/example/proto/greeter.proto", outdir=gen_dir)
