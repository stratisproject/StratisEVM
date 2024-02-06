Quickstart: Run a node and (optionally) stake STRAX 
=========================================
Introduction
---------------

Prysm is an implementation of the [Ethereum proof-of-stake consensus specification](https://github.com/ethereum/consensus-specs). In this quickstart, you’ll use Prysm to run an STRAX node and optionally a validator client. This will let you stake 20,000 STRAX using hardware that you manage.

This is a beginner-friendly guide. Familiarity with the command line is expected, but otherwise this guide makes no assumptions about your technical skills or prior knowledge.

At a high level, we'll walk through the following flow:

1.  Configure an **execution node** using an execution-layer client.
2.  Configure a **beacon node** using Prysm, a consensus-layer client.
3.  Configure a **validator client** and stake STRAX using Prysm (optional).

Step 1: Review prerequisites and best practices
---------------------------------------------------------
**Hardware Requirements**
*   **OS**: 64-bit Linux, Mac OS X 10.14+, Windows 10+ 64-bit
*   **CPU**: 4+ cores @ 2.8+ GHz
*   **Memory**: 16GB+ RAM
*   **Storage**: SSD with at least 1TB free space
*   **Network**: 8 MBit/sec broadband

**Validator Requirements**
* A new machine that has never been connected to the internet that you can use to securely generate your mnemonic phrase and keypair
*   **20,000 STRAX** (Mainnet) or **20,000 tSTRAX** (Testnet)

### Best practices

*   **If you're staking STRAX as a validator, try this guide on a testnet first**, _then_ mainnet.
*   **Keep things simple**. This guidance assumes all client software will run on a single machine.

Step 2: Run an execution client
-------------------------------------

1. Download the latest release of `geth`  for your Operating System from: https://github.com/stratisproject/go-stratis/releases
2. Extract into a location on your host, to the `bin` directory in this repository's local copy. For example `C:\repos\StratisEVM\bin`
3. Navigate to your `bin` directory and execute the following command:

## Windows
#### Auroria (Testnet)
	geth.exe --auroria --http --http.api eth,net,engine,admin --datadir=data\testnet\geth --authrpc.addr=127.0.0.1 --authrpc.jwtsecret=configs/testnet/jwtsecret
#### Mainnet
	geth.exe --http --http.api eth,net,engine,admin --datadir=data\mainnet\geth --authrpc.addr=127.0.0.1 --authrpc.jwtsecret=configs/testnet/jwtsecret
## Linux
#### Auroria (Testnet)
	./geth --auroria --http --http.api eth,net,engine,admin --datadir=data\testnet\geth --authrpc.addr=127.0.0.1 --authrpc.jwtsecret=configs/testnet/jwtsecret
#### Mainnet
	./geth --http --http.api eth,net,engine,admin --datadir=data\mainnet\geth --authrpc.addr=127.0.0.1 --authrpc.jwtsecret=configs/testnet/jwtsecret
## MacOS
#### Auroria (Testnet)
	./geth --auroria --http --http.api eth,net,engine,admin --datadir=data\testnet\geth --authrpc.addr=127.0.0.1 --authrpc.jwtsecret=configs/testnet/jwtsecret
#### Mainnet
	./geth --http --http.api eth,net,engine,admin --datadir=data\mainnet\geth --authrpc.addr=127.0.0.1 --authrpc.jwtsecret=configs/testnet/jwtsecret

The execution layer client cannot sync without an attached beacon node. We'll see how to setup a beacon node in the next step.

Step 3: Run a beacon node using Prysm
-----------------------------------------------
1. Download the latest release of `beacon-chain` and `validator` for your Operating System from: https://github.com/stratisproject/prysm-stratis/releases
2. Extract into a location on your host, to the `bin` directory in this repository's local copy. For example `C:\repos\StratisEVM\bin`
3. Navigate to your `bin` directory and run the following command to start your beacon node that connects to your local execution node:

## Windows
#### Auroria (Testnet)
	beacon-chain.exe --auroria --datadir=data\testnet\beacon --execution-endpoint=http://localhost:8551 --jwt-secret=configs/testnet/jwtsecret
#### Mainnet
	beacon-chain.exe --datadir=data\mainnet\beacon --execution-endpoint=http://localhost:8551 --jwt-secret=configs/testnet/jwtsecret
## Linux
#### Auroria (Testnet)
	./beacon-chain --auroria --datadir=data\testnet\beacon --execution-endpoint=http://localhost:8551 --jwt-secret=configs/testnet/jwtsecret
#### Mainnet
	./beacon-chain --datadir=data\mainnet\beacon --execution-endpoint=http://localhost:8551 --jwt-secret=configs/testnet/jwtsecret
## MacOS
#### Auroria (Testnet)
	./beacon-chain --auroria --datadir=data\testnet\beacon --execution-endpoint=http://localhost:8551 --jwt-secret=configs/testnet/jwtsecret
#### Mainnet
	./beacon-chain --datadir=data\mainnet\beacon --execution-endpoint=http://localhost:8551 --jwt-secret=configs/testnet/jwtsecret

If you are planning to run a validator, it is **strongly** advised to use the `--suggested-fee-recipient=<WALLET ADDRESS>` option. When your validator proposes a block, it will allow you to earn block priority fees, also sometimes called "tips".

Congratulations - you’re now running a **full StratisEVM node**. 

Step 5: Setup validator to Stake
-------------------------------------------
Please refer to the Stratis Staking Launchpad to create your keys for staking:

[Generate Keys (Auroria)](https://auroria.launchpad.stratisevm.com/en/generate-keys)
[Generate Keys (Mainnet)]()

Alternatively, you can follow the below steps:

Step 5a: Generate Keys without Launchpad (Optional)
-----------------------------------------------------------------
Download - ideally on a new machine that has never been connected to the internet - the latest stable version of the deposit CLI from the [Staking Deposit CLI Releases page](https://github.com/stratisproject/staking-deposit-cli) to the `bin` directory in this repository's local copy.

You may choose to provide a withdrawal address with your initial deposit to automatically enable reward payments and also the ability to fully exit your funds at anytime (recommended). This address should be to a regular Stratis address and will be the only address funds can be sent to from your new validator accounts, and cannot be changed once chosen.

Run the following command to create your mnemonic (a unique and **highly sensitive** 24-word phrase) and keys:

## Windows
#### Auroria (Testnet)
	deposit.exe new-mnemonic --num_validators=1 --mnemonic_language=english --chain=auroria --eth1_withdrawal_address=<INSERT ADDRESS>
#### Mainnet
	deposit.exe new-mnemonic --num_validators=1 --mnemonic_language=english --chain=mainnet --eth1_withdrawal_address=<INSERT ADDRESS>
## Linux
#### Auroria (Testnet)
	./deposit new-mnemonic --num_validators=1 --mnemonic_language=english --chain=auroria --eth1_withdrawal_address=<INSERT ADDRESS>
#### Mainnet
	./deposit new-mnemonic --num_validators=1 --mnemonic_language=english --chain=mainnet --eth1_withdrawal_address=<INSERT ADDRESS>
## MacOS
#### Auroria (Testnet)
	./deposit new-mnemonic --num_validators=1 --mnemonic_language=english --chain=auroria --eth1_withdrawal_address=<INSERT ADDRESS>
#### Mainnet
	./deposit new-mnemonic --num_validators=1 --mnemonic_language=english --chain=mainnet --eth1_withdrawal_address=<INSERT ADDRESS>

Follow the CLI prompts to generate your keys, it's better to use the directory `configs/testnet/validator_keys` or `configs/mainnet/validator_keys` for the chosen network. The password you choose will be needed later when importing the generated data into the Prysm validator client. This will give you the following artifacts:

1.  A **new mnemonic seed phrase**. This is **highly sensitive** and should never be exposed to other people or networked hardware.
2.  A `validator_keys` folder. This folder will contain two files:
    1.  `deposit_data-*.json` - contains deposit data that you’ll later upload to the Stratis launchpad.
    2.  `keystore-m_*.json` - contains your public key and encrypted private key.

Step 5b: Import staking keys
----------------------------------

If needed, copy the `validator_keys` folder to your primary machine. Run the following command to import your keystores, replacing `<YOUR_FOLDER_PATH>` with the full path to your `validator_keys` folder:

## Windows
#### Auroria (Testnet)
	validator.exe accounts import --keys-dir=<YOUR_FOLDER_PATH> --auroria
#### Mainnet
	validator.exe accounts import --keys-dir=<YOUR_FOLDER_PATH> --mainnet
## Linux
#### Auroria (Testnet)
	./validator accounts import --keys-dir=<YOUR_FOLDER_PATH> --auroria
#### Mainnet
	./validator accounts import --keys-dir=<YOUR_FOLDER_PATH> --mainnet
## MacOS
#### Auroria (Testnet)
	./validator accounts import --keys-dir=<YOUR_FOLDER_PATH> --auroria
#### Mainnet
	./validator accounts import --keys-dir=<YOUR_FOLDER_PATH> --mainnet

You’ll be prompted to specify a wallet directory twice. Provide the path to your future wallets directory. For example: `C:/repos/StratisEVM/configs/testnet/wallet_dir` or `C:/repos/StratisEVM/configs/mainnet/wallet_dir` for the selected network. You should see `Imported accounts [...] view all of them by running accounts list` when your account has been successfully imported into Prysm.

Step 6: Make staking deposit and run validator
-------------------------------------------

Go to the Stratis Staking Launchpad site and continue through the prompts to upload your `deposit_data-*.json` file. You’ll be prompted to connect your wallet. 

You can then deposit 20,000 STRAX into the Mainnet or Testnet deposit contract via the Launchpad page. Exercise extreme caution throughout this procedure.

If you need tSTRAX, head over to our Discord server or use the Faucet:

*   [Stratis Discord](https://discord.gg/ethstaker)

Next, go to the launcphad and upload your `deposit_data-*.json` file. You’ll be prompted to connect your wallet.

[Auroria Staking Launchpad (Testnet)](https://auroria.launchpad.stratisevm.com/en/generate-keys)
[Stratis Staking Launchpad (Mainnet)](https://launchpad.stratisevm.com/en/generate-keys)

Exercise extreme caution throughout this procedure - **never send real STRAX to the testnet deposit contract.**

Finally, run the following command to start your validator, replacing `<YOUR_FOLDER_PATH>` with the full path to your `wallet_dir` folder (examples: `C:/repos/StratisEVM/configs/testnet/wallet_dir` and `C:/repos/StratisEVM/configs/mainnet/wallet_dir`) and `<YOUR_WALLET_ADDRESS>` by the address of a wallet you own. When your validator proposes a block, it will allow you to earn block priority fees, also sometimes called "tips". See [How to configure Fee Recipient](https://docs.prylabs.network/docs/execution-node/fee-recipient) for more information about this feature:

## Windows
#### Auroria (Testnet)
	validator.exe --wallet-dir=<YOUR_FOLDER_PATH> --auroria --suggested-fee-recipient=<YOUR_WALLET_ADDRESS>
#### Mainnet
	validator.exe --wallet-dir=<YOUR_FOLDER_PATH> --mainnet--suggested-fee-recipient=<YOUR_WALLET_ADDRESS>
### Linux
#### Auroria (Testnet)
	./validator --wallet-dir=<YOUR_FOLDER_PATH> --auroria --suggested-fee-recipient=<YOUR_WALLET_ADDRESS>
#### Mainnet
	./validator -wallet-dir=<YOUR_FOLDER_PATH> --mainnet--suggested-fee-recipient=<YOUR_WALLET_ADDRESS>
## MacOS
#### Auroria (Testnet)
	./validator --wallet-dir=<YOUR_FOLDER_PATH> --auroria --suggested-fee-recipient=<YOUR_WALLET_ADDRESS>
#### Mainnet
	./validator -wallet-dir=<YOUR_FOLDER_PATH> --mainnet--suggested-fee-recipient=<YOUR_WALLET_ADDRESS>

You may wonder why you need to use the `--suggested-fee-recipient` in both beacon node and validator client. The reason is it is possible to plug multiple validator clients to the same beacon node. If no `--suggested-fee-recipient` is set on a validator client, then the beacon node will fallback on its own `--suggested-fee-recipient` when proposing a block.

If no `--suggested-fee-recipient` is set neither on the validator client nor on the beacon node, the corresponding tips will be sent to the burn address, and forever lost,

Congratulations!

You’re now running a **full Stratis node** and a **validator client**. You can leave your **execution client**, **beacon node**, and **validator client** terminal windows open and running. Once your validator is activated, it will automatically begin proposing and validating blocks.
