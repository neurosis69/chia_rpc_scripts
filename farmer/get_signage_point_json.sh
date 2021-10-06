#!/bin/bash

[[ -z "$1" ]] && echo -e "No signage challange chain hash supplied.\nUsage:\t./get_signage_point_json.sh \"a2k3294.....\"" && exit 1

curl -s --insecure --cert _SSLPATH_/private_farmer.crt --key _SSLPATH_/private_farmer.key -d "{\"sp_hash\":\"$1\"}" -H "Content-Type: application/json" -X POST https://_IP_:8559/get_signage_point | jq