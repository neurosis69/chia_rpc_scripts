#!/bin/bash

curl -s --insecure --cert _SSLPATH_/private_wallet.crt --key _SSLPATH_/private_wallet.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:9256/get_public_keys | jq -r '.public_key_fingerprints | keys[] as $k | "public_fingerprints_\($k): \(.[$k])" '
