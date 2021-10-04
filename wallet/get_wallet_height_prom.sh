#!/bin/bash
source initialize.sh
curl -s --insecure --cert $SSLPATH/private_wallet.crt --key $SSLPATH/private_wallet.key -d '{}' -H "Content-Type: application/json" -X POST https://$TARGETIP:9256/get_height_info | jq -r '"chia_rpc_height{coin=\"chia\",service_type=\"wallet\"} \(.height)"'
