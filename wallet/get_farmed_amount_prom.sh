#!/bin/bash

curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_wallet.crt --key _SSLPATH_/private_wallet.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:9256/get_farmed_amount | jq -r ' keys[] as $k | select($k != "success") | "chia_rpc_\($k){coin=\"chia\",service_type=\"wallet\"} \(.[$k])"'
