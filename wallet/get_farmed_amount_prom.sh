#!/bin/bash
source initialize.sh
curl -s --insecure --cert $SSLPATH/private_wallet.crt --key $SSLPATH/private_wallet.key -d '{}' -H "Content-Type: application/json" -X POST https://$TARGETIP:9256/get_farmed_amount | jq -r ' keys[] as $k | "chia_rpc_\($k){coin=\"chia\",service_type=\"wallet\"} \(.[$k])"'
