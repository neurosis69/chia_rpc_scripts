#!/bin/bash
source initialize.sh
curl -s --insecure --cert $SSLPATH/private_wallet.crt --key $SSLPATH/private_wallet.key -d '{"wallet_id":"2"}' -H "Content-Type: applic'a'tion/json" -X POST https://$TARGETIP:9256/pw_status|jq