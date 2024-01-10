build-binaries:
	go clean -modcache	
	cd ./prysm-stratis && go build -o=../bin/beacon-chain ./cmd/beacon-chain
	cd ./go-stratis && go build -o=../bin/geth ./cmd/geth

init-geth-testnet:
	./bin/geth --datadir=data/testnet/geth init configs/testnet/genesis.json

run-geth-testnet:
	./bin/geth \
		--networkid=205205 \
		--auroria \
		--http \
		--http.api=eth,engine,net,web3 \
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
		--p2p-static-id \
		--auroria \
		--datadir=data/testnet/beacon \
		--min-sync-peers=1 \
		--genesis-state=configs/testnet/genesis.ssz \
		--rpc-host=0.0.0.0 \
		--grpc-gateway-host=0.0.0.0 \
		--execution-endpoint=http://localhost:8551 \
		--accept-terms-of-use \
		--jwt-secret=configs/testnet/jwtsecret \
		--suggested-fee-recipient=0x123463a4B065722E99115D6c222f267d9cABb524 \
		--minimum-peers-per-subnet=0 \
		--enable-debug-rpc-endpoints
