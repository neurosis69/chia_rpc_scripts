#!/bin/bash

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/wallet/private_wallet.crt --key ~/.chia/mainnet/config/ssl/wallet/private_wallet.key -d '{}' -H "Content-Type: application/json" -X POST https://localhost:9256/get_height_info | jq -r '"chia_rpc_height{coin=\"chia\",service_type=\"wallet\"} \(.height)"'