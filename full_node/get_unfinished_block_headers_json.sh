#!/bin/bash

curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_full_node.crt --key _SSLPATH_/private_full_node.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:8555/get_unfinished_block_headers| jq