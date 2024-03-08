FROM golang:1.20.12

# Set the working directory in the container
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git make

# Download Prysm binary
RUN wget https://github.com/stratisproject/prysm-stratis/releases/download/0.1.1/beacon-chain-linux-amd64-0ebd251.tar.gz -O beacon-chain.tar.gz && \
    tar -xzf beacon-chain.tar.gz -C /usr/local/bin/ && \
    rm beacon-chain.tar.gz

# Clone the StratisEVM repository
RUN git clone https://github.com/stratisproject/StratisEVM

# Set workdir
WORKDIR /usr/src/app/StratisEVM

# Expose Prysm ports
EXPOSE 4000 13000 12000/udp

# Run Prysm
ENTRYPOINT ["/usr/local/bin/beacon-chain"]
CMD ["--p2p-static-id", "--datadir=data/testnet/beacon", "--auroria", "--rpc-host=0.0.0.0", "--grpc-gateway-host=0.0.0.0", "--execution-endpoint=http://geth:8551", "--accept-terms-of-use", "--jwt-secret=configs/testnet/jwtsecret", "--suggested-fee-recipient=0x123463a4B065722E99115D6c222f267d9cABb524", "--minimum-peers-per-subnet=0", "--enable-debug-rpc-endpoints"]
