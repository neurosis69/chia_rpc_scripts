#!/bin/bash

[[ -z "$1" ]] && echo -e "No Wallet ID supplied.\nUsage:\t./yaml_get_wallet_new_address.sh 1" && exit 1

curl -s --insecure --cert _SSLPATH_/private_wallet.crt --key _SSLPATH_/private_wallet.key -d "{\"wallet_id\": \"$1\", \"new_address\":true}" -H "Content-Type: application/json" -X POST https://_IP_:9256/get_next_address | jq -r '.address'
