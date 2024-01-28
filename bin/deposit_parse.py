#!/usr/bin/env python3

import binascii
import json
import os
import sys
from eth_abi import encode

if len(sys.argv) <= 1:
    raise Exception("You need to specify the path to the deposit JSON")

deposit_file_path = sys.argv[1]

if not os.path.exists(deposit_file_path):
    raise Exception("Deposit file not found at specified path")

deposit_file = open(deposit_file_path, "r")
data = deposit_file.read()
deposit_file.close()

parsed = json.loads(data)

print("==============================================")

for deposit in parsed:
    pubkey = binascii.unhexlify(deposit["pubkey"])
    withdrawal_credentials = binascii.unhexlify(deposit["withdrawal_credentials"])
    signature = binascii.unhexlify(deposit["signature"])
    deposit_data_root = binascii.unhexlify(deposit["deposit_data_root"])

    method_id = "0x22895118"
    args = [pubkey, withdrawal_credentials, signature, deposit_data_root]
    encoded_data = binascii.hexlify(encode(["bytes", "bytes", "bytes", "bytes32"], args))

    # Print encoded data
    print(method_id + encoded_data.decode("utf-8"))
    print("==============================================")

print("COMPLETE")
