#!/bin/bash
source initialize.sh
FINGERPRINT=`curl -s --insecure --cert $SSLPATH/private_wallet.crt --key $SSLPATH/private_wallet.key -d '{}' -H "Content-Type: application/json" -X POST https://$TARGETIP:9256/get_public_keys | jq -r '.public_key_fingerprints[]'`

for i in $FINGERPRINT;
do
        curl -s --insecure --cert $SSLPATH/private_farmer.crt --key $SSLPATH/private_farmer.key -d '{"search_for_private_key":"$FINGERPRINT"}' -H "Content-Type: application/json" -X POST https://$TARGETIP:8559/get_reward_targets | jq --arg fp "$FINGERPRINT" '{"\($fp)":[.]}'
done