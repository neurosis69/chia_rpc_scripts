#!/bin/bash

WALLET_IDs=`curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_wallet.crt --key _SSLPATH_/private_wallet.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:9256/get_wallets | jq  '.wallets[].id'`
for i in $WALLET_IDs;
do
        curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_wallet.crt --key _SSLPATH_/private_wallet.key -d "{\"wallet_id\": \"$i\"}" -H "Content-Type: application/json" -X POST https://_IP_:9256/get_wallet_balance | jq -r '.wallet_balance | keys[] as $k | "chia_rpc_\($k){coin=\"chia\",service_type=\"wallet\",wallet_id=\"\(.wallet_id)\"} \(.[$k])"'
done
