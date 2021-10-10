#!/bin/bash
#Retrieves an estimate of total space validating the chain between two block header hashes.

[[ -z "$1" ]] && echo -e "No start header hash supplied.\nUsage:\t./get_block_record_by_headerhash.sh \"0xf10787324e4c815ede6b4...\"" && exit 1

curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_full_node.crt --key _SSLPATH_/private_full_node.key -d "{\"header_hash\":\"$1\"}" -H "Content-Type: application/json" -X POST https://_IP_:8555/get_block_record | jq