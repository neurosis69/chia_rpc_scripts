#!/bin/bash

CURL_CMD="curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure -d '{}' -H \"Content-Type: application/json\" -X GET"
BASE_URL="https://spacefarmers.io"
FARMERS_API="/api/farmers?page="
STARTPAGE=1
TIMESTMP=`date +%Y%m%d`

while true;
do
        TIMEDATA=`date --utc +%FT%TZ`
		${CURL_CMD} ${BASE_URL}${FARMERS_API}${STARTPAGE} |jq -r --arg tim $TIMEDATA '
                 .data[]
                 |[$tim, .id,.attributes.points_24h,.attributes.ratio_24h,.attributes.tib_24h,.attributes.farmer_name]
                 |@csv
                 ' | tee -a _CSVPATH_/spacefarmers_farmers_json_${TIMESTMP}.csv
        TIMESTMP=`date +%Y%m%d`
        [[ `${CURL_CMD} ${BASE_URL}${FARMERS_API}${STARTPAGE} | jq '.links.next'` == "null" ]] && exit 1
        STARTPAGE=$((STARTPAGE+1))
done