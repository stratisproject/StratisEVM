FROM golang:1.21.6

# Define ARGs with default values
ARG NETWORK=auroria
ARG NETWORK_DIR=testnet

# Set environment variables from ARGs
ENV NETWORK=${NETWORK} \
    NETWORK_DIR=${NETWORK_DIR}

# Set the working directory in the container
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git make build-essential manpages-dev  
	
# Download Source
RUN git clone https://github.com/stratisproject/StratisEVM --recurse-submodules 

# Build Prysm
RUN cd ./StratisEVM/prysm-stratis && \
	go build -o=../bin/beacon-chain ./cmd/beacon-chain

# Expose Prysm ports
EXPOSE 4000 13000 12000/udp

# Set workdir
WORKDIR /usr/src/app/StratisEVM

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["sleep 10; exec /usr/src/app/StratisEVM/bin/beacon-chain --datadir=data/${NETWORK_DIR}/beacon --${NETWORK} --rpc-host=0.0.0.0 --grpc-gateway-host=0.0.0.0 --execution-endpoint=http://geth-auroria-archive:8551 --accept-terms-of-use --jwt-secret=configs/${NETWORK_DIR}/jwtsecret --suggested-fee-recipient=0x0000000000000000000000000000000000001002"]