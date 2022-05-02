
using gRPCClient
gen_dir = "/example/gen"
rm(gen_dir; recursive=true, force=true)
mkpath(gen_dir)
gRPCClient.generate("/example/greeter.proto", outdir=gen_dir)
