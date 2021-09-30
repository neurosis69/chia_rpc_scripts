#!/bin/bash
curl -s --insecure \
	--cert ~/.chia/mainnet/config/ssl/farmer/private_farmer.crt \
	--key ~/.chia/mainnet/config/ssl/farmer/private_farmer.key \
	-H "Content-Type: application/json" \
	-d '{}' \
	-X POST \
	https://localhost:8559/get_harvesters \
		| jq -r '
			.harvesters[] 
				| {
					(.connection.node_id): {
						"host": .connection.host,
						"port":.connection.port, 
						"plots_overall": .plots| length, 
						"plots_OG":  .plots | map(select(.pool_public_key)) | length,
						"plots_NFT": .plots | map(select(.pool_contract_puzzle_hash)) | length,
						"bytes_overall": .plots | map(.file_size) | add,
						"bytes_OG": .plots | map(select(.pool_public_key).file_size) | add,
						"bytes_NFT": .plots | map(select(.pool_contract_puzzle_hash).file_size) | add,
						"failed_to_open_filenames": .failed_to_open_filenames | length, 
						"no_key_filenames": .no_key_filenames| length
					}
				}
		'