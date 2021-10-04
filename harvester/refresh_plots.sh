#!/bin/bash
source initialize.sh
curl -s --insecure --cert $SSLPATH/private_harvester.crt --key $SSLPATH/private_harvester.key -d '{}' -H "Content-Type: application/json" -X POST https://$TARGETIP:8560/refresh_plots| jq