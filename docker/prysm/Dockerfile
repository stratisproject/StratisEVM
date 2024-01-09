FROM golang:1.20.12

# Set the working directory in the container
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git make

# Clone the StratisEVM repository
RUN git clone https://github.com/stratisproject/StratisEVM --recurse-submodules

# Build Prysm from Source
WORKDIR /usr/src/app/StratisEVM/prysm-stratis
RUN go build -o=/usr/local/bin/beacon-chain ./cmd/beacon-chain

# Expose Prysm ports
EXPOSE 4000 13000 12000/udp

# Run Prysm
WORKDIR /usr/src/app/StratisEVM
ENTRYPOINT ["/usr/local/bin/beacon-chain"]
CMD ["--p2p-static-id", "--datadir=data/testnet/beacon", "--rpc-host=0.0.0.0", "--grpc-gateway-host=0.0.0.0", "--execution-endpoint=http://localhost:8551", "--accept-terms-of-use", "--jwt-secret=configs/testnet/jwtsecret", "--suggested-fee-recipient=0x123463a4B065722E99115D6c222f267d9cABb524", "--minimum-peers-per-subnet=0", "--enable-debug-rpc-endpoints"]
