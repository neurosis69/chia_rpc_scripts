#!/bin/bash
#By default show the first 5000 transactions
source initialize.sh
[[ "$#" -eq 0 ]] && echo -e "Illegal number of parameters.\nUsage:\t./csv_get_wallet_transaction_details.sh <Wallet_ID> <Transaction_Type> <Start> <End>\n\nTransaction Types:\n\t0=Incoming\n\t1=Outgoing\n\t2=Pool Reward\n\t3=Farmer Rewards\n\t4=Incoming Trade\n\t5=Outgoing Trade\n\t-1=All Types\n\nStart/End:\n\tList transactions from start to end.\n\tLeave these parameters blank to print the first 5.000 transactions.\n" && exit 1
[[ -z "$1" ]] && echo -e "ERROR: No wallet ID supplied.\nUsage:\t./csv_get_wallet_transaction_details.sh <Wallet_ID> <Transaction_Type> <Start> <End>" && exit 2
[[ -z "$2" ]] && echo -e "ERROR: No transaction type supplied.\nUsage:\t./csv_get_wallet_transaction_details.sh <Wallet_ID> <Transaction_Type> <Start> <End>" && exit 3
[[ -z "$3" ]] && ST=0 || ST=$3
[[ -z "$4" ]] && ET=5000 || ET=$4

echo "\"amount\",\"confirmed\",\"confirmed_at_height\",\"created_at_time\",\"fee_amount\",\"name\",\"sent\",\"to_address\",\"to_puzzle_hash\",\"trade_id\",\"type\",\"wallet_id\""
curl -s --insecure --cert $SSLPATH/private_wallet.crt --key $SSLPATH/private_wallet.key -d "{\"wallet_id\": \"$1\", \"start\":$ST, \"end\":$ET}" -H "Content-Type: application/json" -X POST https://$TARGETIP:9256/get_transactions | jq -r --argjson transtype $2 '.transactions[] | if $transtype == -1 then select(keys != "additions") else select((.type == $transtype) and (keys != "additions")) end | [.amount,.confirmed,.confirmed_at_height,.created_at_time,.fee_amount,.name,.sent,.to_address,.to_puzzle_hash,.trade_id,.type,.wallet_id] | map(. // "null") | @csv'
