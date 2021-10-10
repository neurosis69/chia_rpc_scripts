#!/bin/bash
#First 5000 Transactions

[[ -z "$1" ]] && echo -e "No txn name supplied.\nUsage:\t./prom_get_wallet_transaction.sh \"0x349294.....\"" && exit 1
echo -e "CSV Output:"
echo "\"amount\",\"confirmed\",\"confirmed_at_height\",\"created_at_time\",\"fee_amount\",\"name\",\"sent\",\"to_address\",\"to_puzzle_hash\",\"trade_id\",\"type\",\"wallet_id\""
curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_wallet.crt --key _SSLPATH_/private_wallet.key -d "{\"transaction_id\":\"${1}\"}" -H "Content-Type: application/json" -X POST https://_IP_:9256/get_transaction| jq -r '.transaction | [.amount,.confirmed,.confirmed_at_height,.created_at_time,.fee_amount,.name,.sent,.to_address,.to_puzzle_hash,.trade_id,.type,.wallet_id] | map(. // "null")| @csv'

echo -e "\nJSON Output:"
curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_wallet.crt --key _SSLPATH_/private_wallet.key -d "{\"transaction_id\":\"${1}\"}" -H "Content-Type: application/json" -X POST https://_IP_:9256/get_transaction| jq -r '.transaction'
