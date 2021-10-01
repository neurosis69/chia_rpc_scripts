#!/bin/bash

CURL_CMD="curl -s --insecure -d '{}' -H \"Content-Type: application/json\" -X GET"
BASE_URL="https://spacefarmers.io"
FARMERS_API="/api/farmers?page="
STARTPAGE=1
TIMESTMP=`date +%Y%m%d`

while true;
do
        ${CURL_CMD} ${BASE_URL}${FARMERS_API}${STARTPAGE} |jq -r --arg tim $TIMESTMP '
                 .data[]
                 |[$tim, .id,.attributes.points_24h,.attributes.ratio_24h,.attributes.tib_24h,.attributes.farmer_name]
                 |@csv
                 ' | tee -a csv/spacefarmers_farmers_json_${TIMESTMP}.csv
        TIMESTMP=`date +%Y%m%d`
        [[ `${CURL_CMD} ${BASE_URL}${FARMERS_API}${STARTPAGE} | jq '.links.next'` == "null" ]] && exit 1
        STARTPAGE=$((STARTPAGE+1))
done