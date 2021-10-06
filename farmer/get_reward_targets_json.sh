#!/bin/bash

FINGERPRINT=`curl -s --insecure --cert _SSLPATH_/private_wallet.crt --key _SSLPATH_/private_wallet.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:9256/get_public_keys | jq -r '.public_key_fingerprints[]'`

for i in $FINGERPRINT;
do
        curl -s --insecure --cert _SSLPATH_/private_farmer.crt --key _SSLPATH_/private_farmer.key -d '{"search_for_private_key":"$FINGERPRINT"}' -H "Content-Type: application/json" -X POST https://_IP_:8559/get_reward_targets | jq --arg fp "$FINGERPRINT" '{"\($fp)":[.]}'
done