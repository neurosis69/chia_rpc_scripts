#!/bin/bash

[[ -z "$1" ]] && echo -e "No directory supplied.\nUsage:\t./remove_plot_directory.sh \"/usb-farmer1.....\"" && exit 1

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/harvester/private_harvester.crt --key ~/.chia/mainnet/config/ssl/harvester/private_harvester.key -d "{\"dirname\":\"$1\"}" -H "Content-Type: application/json" -X POST https://localhost:8560/remove_plot_directory