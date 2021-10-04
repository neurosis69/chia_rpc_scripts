#!/bin/bash
source initialize.sh
[[ -z "$1" ]] && echo -e "No Wallet ID supplied.\nUsage:\t./yaml_get_wallet_new_address.sh 1" && exit 1

curl -s --insecure --cert $SSLPATH/private_wallet.crt --key $SSLPATH/private_wallet.key -d "{\"wallet_id\": \"$1\", \"new_address\":true}" -H "Content-Type: application/json" -X POST https://$TARGETIP:9256/get_next_address | jq -r '.address'
