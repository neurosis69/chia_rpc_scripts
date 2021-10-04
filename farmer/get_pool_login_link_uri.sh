#!/bin/bash
source initialize.sh
LAUNCHERID=`curl -s --insecure --cert $SSLPATH/private_wallet.crt --key $SSLPATH/private_wallet.key -d '{"wallet_id":"2"}' -H "Content-Type: applic'a'tion/json" -X POST https://$TARGETIP:9256/pw_status|jq -r '.state.launcher_id'`

curl -s --insecure --cert $SSLPATH/private_farmer.crt --key $SSLPATH/private_farmer.key -d "{\"launcher_id\":\"${LAUNCHERID}\"}" -H "Content-Type: application/json" -X POST https://$TARGETIP:8559/get_pool_login_link | jq -r '.login_link'