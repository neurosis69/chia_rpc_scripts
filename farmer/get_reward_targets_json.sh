#!/bin/bash

FINGERPRINT=`curl -s --insecure --cert ~/.chia/mainnet/config/ssl/wallet/private_wallet.crt --key ~/.chia/mainnet/config/ssl/wallet/private_wallet.key -d '{}' -H "Content-Type: application/json" -X POST https://localhost:9256/get_public_keys | jq -r '.public_key_fingerprints[]'`

for i in $FINGERPRINT;
do
        curl -s --insecure --cert ~/.chia/mainnet/config/ssl/farmer/private_farmer.crt --key ~/.chia/mainnet/config/ssl/farmer/private_farmer.key -d '{"search_for_private_key":"$FINGERPRINT"}' -H "Content-Type: application/json" -X POST https://localhost:8559/get_reward_targets | jq --arg fp "$FINGERPRINT" '{"\($fp)":[.]}'
done