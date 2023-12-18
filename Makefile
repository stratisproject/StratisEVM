build-binaries:
	cd ./prysm-stratis && go build -o=../bin/beacon-chain ./cmd/beacon-chain
	cd ./go-ethereum && go build -o=../bin/geth ./cmd/geth

init-geth-testnet:
	./bin/geth --datadir=data/testnet/geth init configs/testnet/genesis.json

run-geth-testnet:
	./bin/geth \
		--bootnodes=enode://46d68d753537d4396564199dc348dc9293a5926198cb83ee27beba3d2b1a60cc682c63114bec77686fb81a49fe1c3f9782374935636613fdd6b6f0874ed657bc@207.154.197.204:0?discport=30303 \
		--nodekey=configs/testnet/boot.key \
		--http \
		--http.api=admin,eth,engine,net,web3 \
		--http.addr=0.0.0.0 \
		--http.corsdomain=* \
		--ws \
		--ws.api=eth,engine,net,web3 \
		--ws.addr=0.0.0.0 \
		--ws.origins=* \
		--authrpc.vhosts=* \
		--authrpc.addr=0.0.0.0 \
		--authrpc.jwtsecret=configs/testnet/jwtsecret \
		--datadir=data/testnet/geth \
		--syncmode=full

run-beacon-testnet:
	./bin/beacon-chain \
		--stratis \
		--datadir=data/testnet/beacon \
		--min-sync-peers=0 \
		--genesis-state=configs/testnet/genesis.ssz \
		--bootstrap-node=enr:-MK4QKB48dguQjy-JFlaNyY0QWtpawNE4SAHly1O49wCd3qJZmk_dxFn9K4GCukNbyG5dMZA1R1EIc5EwVm4ihKlRsSGAYx90Iy1h2F0dG5ldHOIAABgAAAAAACEZXRoMpAZsrCWIAAAc___________gmlkgnY0gmlwhM-axcyJc2VjcDI1NmsxoQMBiKGri5pquGTFRS8dFCtoBDnjkVHQv6rn5PB37DGBAYhzeW5jbmV0cw-DdGNwgjLIg3VkcIIu4A \
		--rpc-host=0.0.0.0 \
		--grpc-gateway-host=0.0.0.0 \
		--execution-endpoint=http://localhost:8551 \
		--accept-terms-of-use \
		--jwt-secret=configs/testnet/jwtsecret \
		--suggested-fee-recipient=0x123463a4B065722E99115D6c222f267d9cABb524 \
		--minimum-peers-per-subnet=0 \
		--enable-debug-rpc-endpoints