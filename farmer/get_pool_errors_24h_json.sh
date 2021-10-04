#!/bin/bash
# There is no timestamp/date field for reported errors, so no age of the entries is listed
# rpc requests returns more than 24h, see https://github.com/Chia-Network/chia-blockchain/pull/7906
source initialize.sh
curl -s --insecure --cert $SSLPATH/private_farmer.crt --key $SSLPATH/private_farmer.key -d '{}' -H "Content-Type: application/json" -X POST https://$TARGETIP:8559/get_pool_state | jq -c '.pool_state[0].pool_errors_24h[]'