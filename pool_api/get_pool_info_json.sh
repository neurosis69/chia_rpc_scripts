#!/bin/bash

curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure -d '{}' -H "Content-Type: application/json" -X GET https://xch.spacefarmers.io/pool_info|jq