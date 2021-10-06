#!/bin/bash

curl -s --insecure --cert _SSLPATH_/private_harvester.crt --key _SSLPATH_/private_harvester.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:8560/get_plot_directories | jq -r '.directories[]'