build-binaries:
	cd ./prysm-stratis && go build -o=../bin/beacon-chain ./cmd/beacon-chain
	cd ./go-ethereum && go build -o=../bin/geth ./cmd/geth

init-geth-testnet:
	./bin/geth --datadir=data/testnet/geth init configs/testnet/genesis.json

run-geth-testnet:
	./bin/geth \
		--bootnodes=enode://46d68d753537d4396564199dc348dc9293a5926198cb83ee27beba3d2b1a60cc682c63114bec77686fb81a49fe1c3f9782374935636613fdd6b6f0874ed657bc@207.154.197.204:0?discport=30303,enode://e9e2beba4d197733a435a4b5827d032201f9511a6aceccbaf729dd5cb9f1007d9b5866eea514a007fe54bf94164783d344caeb44f810ae000ff4e95d455fa98d@144.126.200.138:0?discport=30303 \
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
		--authrpc.jwtsecret=configs/jwtsecret \
		--datadir=data/geth \
		--syncmode=full

run-beacon-testnet:
	./bin/beacon-chain \
		--p2p-static-id \
		--bootstrap-node=enr:-MK4QC0RZEk8vnHDV_r545j_fr0sMJiFDTg5XzjvMGvNpWC8Z7CxHXYIk8v5QQv98hag9GhwGfsS4i0gMgpuTOq0ddOGAYx-0Ebwh2F0dG5ldHOIgAEAAAAAAACEZXRoMpAZsrCWIAAAc___________gmlkgnY0gmlwhJB-yIqJc2VjcDI1NmsxoQJc7jQivE8v8maM__IlAQjRlk3fUjQ6g28LDm_yvuFTVIhzeW5jbmV0cwCDdGNwgjLIg3VkcIIu4A \
		--bootstrap-node=enr:-MK4QOiposnqkGSkVcVXeS2RvaMOgLOWFRxJUGyIBQE5y7OITeshOx324-ziiP5rMXtq2UQzEEzBeVCV9x9qkZchGWKGAYx-0AIKh2F0dG5ldHOIAAAAAwAAAACEZXRoMpAZsrCWIAAAc___________gmlkgnY0gmlwhM-axcyJc2VjcDI1NmsxoQNtJ-08vT80nEn18osacUCGm7n7cC_AnQWe0lD6jSKp9YhzeW5jbmV0cw-DdGNwgjLIg3VkcIIu4A \
		--stratis \
		--datadir=data/beacon \
		--min-sync-peers=1 \
		--genesis-state=configs/genesis.ssz \
		--rpc-host=0.0.0.0 \
		--grpc-gateway-host=0.0.0.0 \
		--execution-endpoint=http://localhost:8551 \
		--accept-terms-of-use \
		--jwt-secret=configs/jwtsecret \
		--suggested-fee-recipient=0x123463a4B065722E99115D6c222f267d9cABb524 \
		--minimum-peers-per-subnet=0 \
		--enable-debug-rpc-endpoints
