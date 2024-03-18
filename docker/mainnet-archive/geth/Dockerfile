FROM golang:1.21.6

# Define ARGs with default values
ARG NETWORK=mainnet
ARG SYNCMODE=archive

# Set environment variables from ARGs
ENV NETWORK=${NETWORK} \
    SYNCMODE=${SYNCMODE}

# Set the working directory in the container
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git make build-essential manpages-dev  
	
# Download Source
RUN git clone https://github.com/stratisproject/StratisEVM -b mainnet --recurse-submodules 

# Build Geth
RUN cd ./StratisEVM/go-stratis && \
	go build -o=../bin/geth ./cmd/geth

# Expose Geth ports
EXPOSE 8545 30303

# Set workdir
WORKDIR /usr/src/app/StratisEVM

# Run Geth
ENTRYPOINT /usr/src/app/StratisEVM/bin/geth --datadir=data/${NETWORK}/geth --${NETWORK} --gcmode=${SYNCMODE} --http --http.api=eth,engine,net,web3 --http.addr=0.0.0.0 --http.corsdomain=* --ws --ws.api=eth,engine,net,web3 --ws.addr=0.0.0.0 --ws.origins=* --authrpc.vhosts=* --authrpc.addr=0.0.0.0 --authrpc.jwtsecret=configs/${NETWORK}/jwtsecret --syncmode=full