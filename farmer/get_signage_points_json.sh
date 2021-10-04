#!/bin/bash
source initialize.sh
curl -s --insecure --cert $SSLPATH/private_farmer.crt --key $SSLPATH/private_farmer.key -d '{}' -H "Content-Type: application/json" -X POST https://$TARGETIP:8559/get_signage_points | jq