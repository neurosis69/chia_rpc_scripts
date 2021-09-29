#!/bin/bash

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/wallet/private_wallet.crt --key ~/.chia/mainnet/config/ssl/wallet/private_wallet.key -d '{"wallet_id":"2"}' -H "Content-Type: applic'a'tion/json" -X POST https://localhost:9256/pw_status|jq -r '.state.launcher_id'