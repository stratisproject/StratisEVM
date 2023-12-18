# StratisEVM

This is a repository for the Ethereum-based Stratis Blockchain; StratisEVM.

1. Clone Repo Recursively
```
git clone https://github.com/stratisproject/StratisEVM --recurse-submodules
```
2. Build Binaries from Source (Optional)
```
wget https://go.dev/dl/go1.20.12.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.20*.tar.gz
export PATH=$PATH:/usr/local/go/bin
source $HOME/.profile
cd StratisEVM
make build-binaries
```
3. Initalize GETH
```
make init-geth-testnet
```
4. Run GETH (Execution Client)
```
make run-geth-testnet
```
5. Run Beacon (Consensus Client)
```
make run-beacon-testnet
```
