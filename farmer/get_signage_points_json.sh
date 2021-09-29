#!/bin/bash

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/farmer/private_farmer.crt --key ~/.chia/mainnet/config/ssl/farmer/private_farmer.key -d '{}' -H "Content-Type: application/json" -X POST https://localhost:8559/get_signage_points | jq