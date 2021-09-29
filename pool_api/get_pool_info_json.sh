#!/bin/bash

curl -s --insecure -d '{}' -H "Content-Type: application/json" -X GET https://xch.spacefarmers.io/pool_info|jq