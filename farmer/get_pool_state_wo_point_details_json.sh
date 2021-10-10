#!/bin/bash

curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_farmer.crt --key _SSLPATH_/private_farmer.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:8559/get_pool_state | jq -r '.pool_state[0]|with_entries(select([.key] | contains(["_24h"])| not))'