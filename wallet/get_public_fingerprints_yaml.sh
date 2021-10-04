#!/bin/bash
source initialize.sh
curl -s --insecure --cert $SSLPATH/private_wallet.crt --key $SSLPATH/private_wallet.key -d '{}' -H "Content-Type: application/json" -X POST https://$TARGETIP:9256/get_public_keys | jq -r '.public_key_fingerprints | keys[] as $k | "public_fingerprints_\($k): \(.[$k])" '
