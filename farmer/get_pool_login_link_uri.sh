#!/bin/bash

LAUNCHERID=`curl -s --insecure --cert _SSLPATH_/private_wallet.crt --key _SSLPATH_/private_wallet.key -d '{"wallet_id":"2"}' -H "Content-Type: applic'a'tion/json" -X POST https://_IP_:9256/pw_status|jq -r '.state.launcher_id'`

curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_farmer.crt --key _SSLPATH_/private_farmer.key -d "{\"launcher_id\":\"${LAUNCHERID}\"}" -H "Content-Type: application/json" -X POST https://_IP_:8559/get_pool_login_link | jq -r '.login_link'