#!/bin/bash

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/harvester/private_harvester.crt --key ~/.chia/mainnet/config/ssl/harvester/private_harvester.key -d '{}' -H "Content-Type: application/json" -X POST https://localhost:8560/get_plot_directories | jq -r '.directories[]'