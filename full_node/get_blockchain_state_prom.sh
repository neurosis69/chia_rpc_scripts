#!/bin/bash

curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_full_node.crt --key _SSLPATH_/private_full_node.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:8555/get_blockchain_state | jq -r '.blockchain_state | "chia_rpc_blockchain_state_difficulty{coin=\"chia\",service_type=\"full_node\"} \(.difficulty)"'
curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_full_node.crt --key _SSLPATH_/private_full_node.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:8555/get_blockchain_state | jq -r '.blockchain_state | "chia_rpc_blockchain_state_fee_amount{coin=\"chia\",service_type=\"full_node\"} \(.peak.fees)"'
curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_full_node.crt --key _SSLPATH_/private_full_node.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:8555/get_blockchain_state | jq -r '.blockchain_state | "chia_rpc_blockchain_state_height{coin=\"chia\",service_type=\"full_node\"} \(.peak.height)"'
curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_full_node.crt --key _SSLPATH_/private_full_node.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:8555/get_blockchain_state | jq -r '.blockchain_state | "chia_rpc_blockchain_state_netspace{coin=\"chia\",service_type=\"full_node\"} \(.space)"'