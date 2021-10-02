#!/bin/bash

curl -s --insecure --cert ~/.chia/mainnet/config/ssl/full_node/private_full_node.crt --key ~/.chia/mainnet/config/ssl/full_node/private_full_node.key -d '{}' -H "Content-Type: application/json" -X POST https://localhost:8555/get_unfinished_block_headers| jq
{\rtf1}