#!/bin/bash

[[ -z "$1" ]] && echo -e "No Public Key Fingerprint supplied.\nUsage:\t./json_get_private_key.sh 12345678901..." && exit 1

echo  -e "\n\n"
echo  -e "\033[33;5m\tATTENTION!\033[0m"
echo  -e "\n"
echo  -e "\033[33;5;7m\tThis script will expose your private key seed/mnemonic!\033[0m"
echo  -e "\n\n"
read -r -s -p $'Press enter to continue...'

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/wallet/private_wallet.crt --key ~/.chia/mainnet/config/ssl/wallet/private_wallet.key -d "{\"fingerprint\":$1}" -H "Content-Type: application/json" -X POST https://localhost:9256/get_private_key | jq
