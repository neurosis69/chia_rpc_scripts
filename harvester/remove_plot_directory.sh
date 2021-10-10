#!/bin/bash

[[ -z "$1" ]] && echo -e "No directory supplied.\nUsage:\t./remove_plot_directory.sh \"/usb-farmer1.....\"" && exit 1

curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_harvester.crt --key _SSLPATH_/private_harvester.key -d "{\"dirname\":\"$1\"}" -H "Content-Type: application/json" -X POST https://_IP_:8560/remove_plot_directory