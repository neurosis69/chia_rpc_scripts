#!/bin/bash
source initialize.sh
curl -s --insecure --cert $SSLPATH/private_farmer.crt --key $SSLPATH/private_farmer.key -d '{}' -H "Content-Type: application/json" -X POST https://$TARGETIP:8559/get_pool_state | jq -r '"chia_rpc_current_difficulty{coin=\"chia\",service_type=\"farmer\"} \(.pool_state[0].points_acknowledged_since_start)"'