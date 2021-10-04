#/bin/bash
source initialize.sh
[[ -z "$1" ]] && echo -e "No signage point hash supplied.\nUsage:\t./get_recent_signage_point_or_eos_json.sh \"0xle23l1344deb...\"" && exit 1

curl -s --insecure --cert $SSLPATH/private_full_node.crt --key $SSLPATH/private_full_node.key -d "{\"sp_hash\":\"$1\"}" -H "Content-Type: application/json" -X POST https://$TARGETIP:8555/get_recent_signage_point_or_eos| jq