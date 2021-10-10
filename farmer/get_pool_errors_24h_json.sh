#!/bin/bash
# There is no timestamp/date field for reported errors, so no age of the entries is listed
# rpc requests returns more than 24h, see https://github.com/Chia-Network/chia-blockchain/pull/7906

curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_farmer.crt --key _SSLPATH_/private_farmer.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:8559/get_pool_state | jq -c '.pool_state[0].pool_errors_24h[]'