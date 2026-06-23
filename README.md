# RemoteFHE

A minimal Julia project demonstrating a simple OpenFHE client/server flow.

## Overview

- `RemoteFHE` creates an OpenFHE-backed `SecureContext`.
- The client encrypts a vector with a public key and sends the ciphertext to the server.
- The server processes the encrypted payload and sends the encrypted result back.
- The client decrypts the returned ciphertext with its private key.

## Usage

1. Start the server:

```sh
julia --project=RemoteFHE examples/server.jl
```

2. In another terminal, run the client:

```sh
julia --project=RemoteFHE examples/client.jl
```

## Notes

This project uses Julia's `Sockets` and `Serialization` libraries for transport.
The server does not decrypt client data; it operates on encrypted ciphertext and returns an encrypted result.

# Ideas for the Future

## gRPC

For a standardized and established way of managing Remote Procedure calls, we could use gRPC. There currently is no official implementation for julia, see the [gRPC repository list](https://github.com/orgs/grpc/repositories).

There are
- [gRPCClient.jl](https://github.com/JuliaIO/gRPCClient.jl), since 2021, 65 GitHub stars
- [gRPCServer.jl](https://github.com/s-celles/gRPCServer.jl), since 2026, 5 GitHub stars


The client side is much more mature thatn the server. Implement the server in C++ and the client in julia?

## Distributed.jl

NOTE: This idea if off the table since the nodes dont necessarily trust the clients to execute arbitrary code.

With the current approach, the algorithms that the server can run must be predefined. We could use [Distributed.jl](https://github.com/JuliaLang/Distributed.jl) to execute arbitrary code on the remote server.
This would give us
