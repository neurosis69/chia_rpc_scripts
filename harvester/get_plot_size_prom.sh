#!/bin/bash

NFT_PLOT_LIST=`curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_harvester.crt --key _SSLPATH_/private_harvester.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:8560/get_plots | jq '.plots[] | select(.pool_contract_puzzle_hash!=null) | .file_size'`
OG_PLOT_LIST=`curl -s --connect-timeout _CONNTIMEOUT_ --max-time _MAXTIMEOUT_ --insecure --cert _SSLPATH_/private_harvester.crt --key _SSLPATH_/private_harvester.key -d '{}' -H "Content-Type: application/json" -X POST https://_IP_:8560/get_plots | jq '.plots[] | select(.pool_public_key!=null) | .file_size'`
export NFT_SUM=OG_SUM=0
for i in $NFT_PLOT_LIST; do NFT_SUM=$((NFT_SUM + i)); done
for i in $OG_PLOT_LIST; do OG_SUM=$((OG_SUM + i)); done
echo -e "# HELP chia_og_plots_size_bytes size of all OG plots in bytes"
echo -e "# TYPE chia_og_plots_size_bytes gauge"
echo -e "chia_og_plots_size_bytes "$OG_SUM
echo -e "# HELP chia_nft_plots_size_bytes size of all OG plots in bytes"
echo -e "# TYPE chia_nft_plots_size_bytes gauge"
echo -e "chia_nft_plots_size_bytes "$NFT_SUM
