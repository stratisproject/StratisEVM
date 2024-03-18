FROM golang:1.21.6

# Define ARGs with default values
ARG NETWORK=auroria
ARG NETWORK_DIR=testnet
ARG SYNCMODE=archive

# Set environment variables from ARGs
ENV NETWORK=${NETWORK} \
    SYNCMODE=${SYNCMODE} \
    NETWORK_DIR=${NETWORK_DIR}

# Set the working directory in the container
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git make build-essential manpages-dev  
	
# Download Source
RUN git clone https://github.com/stratisproject/StratisEVM --recurse-submodules 

# Build Geth
RUN cd ./StratisEVM/go-stratis && \
	go build -o=../bin/geth ./cmd/geth

# Expose Geth ports
EXPOSE 8545 30303

# Set workdir
WORKDIR /usr/src/app/StratisEVM

# Run Geth
ENTRYPOINT /usr/src/app/StratisEVM/bin/geth --datadir=data/${NETWORK_DIR}/geth --${NETWORK} --gcmode=${SYNCMODE} --http --http.api=eth,engine,net,web3 --http.addr=0.0.0.0 --http.corsdomain=* --ws --ws.api=eth,engine,net,web3 --ws.addr=0.0.0.0 --ws.origins=* --authrpc.vhosts=* --authrpc.addr=0.0.0.0 --authrpc.jwtsecret=configs/${NETWORK_DIR}/jwtsecret --syncmode=full