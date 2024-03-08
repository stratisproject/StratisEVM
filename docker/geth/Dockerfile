FROM golang:1.20.12

# Set the working directory in the container
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git make

# Download Geth binary
RUN wget https://github.com/stratisproject/go-stratis/releases/download/0.1.1/geth-linux-amd64-5c4504c.tar.gz -O geth.tar.gz && \
    tar -xzf geth.tar.gz -C /usr/local/bin/ && \
    rm geth.tar.gz

# Clone the StratisEVM repository
RUN git clone https://github.com/stratisproject/StratisEVM

# Set workdir
WORKDIR /usr/src/app/StratisEVM/

# Expose Geth ports
EXPOSE 8545 30303

# Run Geth
ENTRYPOINT ["/usr/local/bin/geth"]
CMD ["--datadir=data/testnet/geth", "--auroria" ,"--http", "--http.api=eth,engine,net,web3", "--http.addr=0.0.0.0", "--http.corsdomain=*", "--ws", "--ws.api=eth,engine,net,web3", "--ws.addr=0.0.0.0", "--ws.origins=*", "--authrpc.vhosts=*", "--authrpc.addr=0.0.0.0", "--authrpc.jwtsecret=configs/testnet/jwtsecret", "--syncmode=full"]
