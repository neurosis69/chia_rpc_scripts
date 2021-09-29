#!/bin/bash

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/wallet/private_wallet.crt --key ~/.chia/mainnet/config/ssl/wallet/private_wallet.key -d '{}' -H "Content-Type: application/json" -X POST https://localhost:9256/get_farmed_amount | jq -r ' keys[] as $k | "chia_rpc_\($k){coin=\"chia\",service_type=\"wallet\"} \(.[$k])"'
