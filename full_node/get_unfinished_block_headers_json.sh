#!/bin/bash
source initialize.sh
curl -s --insecure --cert $SSLPATH/private_full_node.crt --key $SSLPATH/private_full_node.key -d '{}' -H "Content-Type: application/json" -X POST https://$TARGETIP:8555/get_unfinished_block_headers| jq