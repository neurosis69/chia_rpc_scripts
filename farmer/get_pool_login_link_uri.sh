#!/bin/bash

[[ -z "$1" ]] && echo -e "No launcher_id supplied.\nUsage:\t./prom_get_pool_login_link.sh \"o40df929rfio.....\"" && exit 1
curl -s --insecure --cert ~/.chia/mainnet/config/ssl/farmer/private_farmer.crt --key ~/.chia/mainnet/config/ssl/farmer/private_farmer.key -d "{\"launcher_id\":\"${1}\"}" -H "Content-Type: application/json" -X POST https://localhost:8559/get_pool_login_link | jq -r '.login_link'
