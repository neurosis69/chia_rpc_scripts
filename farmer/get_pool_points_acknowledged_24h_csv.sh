#!/bin/bash
# rpc requests returns more than 24h, see https://github.com/Chia-Network/chia-blockchain/pull/7906
source initialize.sh
echo "\"timestamp\",\"difficulty\""
curl -s --insecure --cert $SSLPATH/private_farmer.crt --key $SSLPATH/private_farmer.key -d '{}' -H "Content-Type: application/json" -X POST https://$TARGETIP:8559/get_pool_state | jq -r '.pool_state[].points_acknowledged_24h[] | @csv'