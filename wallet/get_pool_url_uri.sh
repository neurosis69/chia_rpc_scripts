#!/bin/bash

curl -s --insecure --cert _SSLPATH_/private_wallet.crt --key _SSLPATH_/private_wallet.key -d '{"wallet_id":"2"}' -H "Content-Type: applic'a'tion/json" -X POST https://_IP_:9256/pw_status|jq -r '.state.current.pool_url'