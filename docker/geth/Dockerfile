FROM golang:1.20.12

# Set the working directory in the container
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git make

# Clone the StratisEVM repository
RUN git clone https://github.com/stratisproject/StratisEVM --recurse-submodules

# Build Geth from Source
WORKDIR /usr/src/app/StratisEVM/go-ethereum
RUN go build -o=/usr/local/bin/geth ./cmd/geth

# Initialize GETH
WORKDIR /usr/src/app/StratisEVM
RUN /usr/local/bin/geth --datadir=data/testnet/geth init configs/testnet/genesis.json

# Expose Geth ports
EXPOSE 8545 30303

# Run Geth
ENTRYPOINT ["/usr/local/bin/geth"]
CMD ["--datadir=data/testnet/geth", "--http", "--http.api=eth,engine,net,web3", "--http.addr=0.0.0.0", "--http.corsdomain=*", "--ws", "--ws.api=eth,engine,net,web3", "--ws.addr=0.0.0.0", "--ws.origins=*", "--authrpc.vhosts=*", "--authrpc.addr=0.0.0.0", "--authrpc.jwtsecret=configs/testnet/jwtsecret", "--syncmode=full"]
