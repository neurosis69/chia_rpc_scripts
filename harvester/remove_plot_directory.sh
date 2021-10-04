#!/bin/bash
source initialize.sh
[[ -z "$1" ]] && echo -e "No directory supplied.\nUsage:\t./remove_plot_directory.sh \"/usb-farmer1.....\"" && exit 1

curl -s --insecure --cert $SSLPATH/private_harvester.crt --key $SSLPATH/private_harvester.key -d "{\"dirname\":\"$1\"}" -H "Content-Type: application/json" -X POST https://$TARGETIP:8560/remove_plot_directory