#!/bin/bash

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/wallet/private_wallet.crt --key ~/.chia/mainnet/config/ssl/wallet/private_wallet.key -d '{}' -H "Content-Type: application/json" -X POST https://localhost:9256/get_public_keys | jq -r '.public_key_fingerprints | keys[] as $k | "public_fingerprints_\($k): \(.[$k])" '
