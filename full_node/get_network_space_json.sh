#!/bin/bash
#Retrieves an estimate of total space validating the chain between two block header hashes.

[[ -z "$1" ]] && echo -e "No start header hash supplied.\nUsage:\t./get_network_space_json.sh \"0xf10787324e4c815ede6b4...\"" && exit 1
[[ -z "$2" ]] && echo -e "No end header hash height supplied.\nUsage:\t./get_network_space_json.sh \"0xbb2bed4c51670dde8...\"" && exit 2

curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_full_node.crt --key _SSLPATH_/private_full_node.key -d "{\"newer_block_header_hash\":\"$1\",\"older_block_header_hash\":\"$2\"}" -H "Content-Type: application/json" -X POST https://_IP_:8555/get_network_space | jq