#!/bin/bash

[[ -z "$1" ]] && echo -e "No Wallet ID supplied.\nUsage:\t./yaml_get_wallet_new_address.sh 1" && exit 1

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/wallet/private_wallet.crt --key ~/.chia/mainnet/config/ssl/wallet/private_wallet.key -d "{\"wallet_id\": \"$1\", \"new_address\":true}" -H "Content-Type: application/json" -X POST https://localhost:9256/get_next_address | jq -r '.address'
