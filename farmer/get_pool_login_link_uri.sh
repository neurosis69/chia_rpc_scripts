#!/bin/bash

LAUNCHERID=`curl -s --insecure --cert ~/.chia/mainnet/config/ssl/wallet/private_wallet.crt --key ~/.chia/mainnet/config/ssl/wallet/private_wallet.key -d '{"wallet_id":"2"}' -H "Content-Type: applic'a'tion/json" -X POST https://localhost:9256/pw_status|jq -r '.state.launcher_id'`

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/farmer/private_farmer.crt --key ~/.chia/mainnet/config/ssl/farmer/private_farmer.key -d "{\"launcher_id\":\"${LAUNCHERID}\"}" -H "Content-Type: application/json" -X POST https://localhost:8559/get_pool_login_link | jq -r '.login_link'