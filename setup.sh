#!/bin/bash
OSUSERHOME=`echo ~`
SETUPSCRIPT=$(readlink -f "$0")
BASEPATH=$(dirname "$SETUPSCRIPT")
echo $BASEPATH
#declare array of chia service types
declare -a SERVICETYPES=("farmer" "wallet" "full_node" "harvester")

#read ssl path
read -p "Enter path to SSL cert/key files[$OSUSERHOME/.chia]:" SSLPATH
SSLPATH=${SSLPATH:-$OSUSERHOME/.chia}

for i in  ${SERVICETYPES[@]}; do
        read -p "Enter path to SSL cert/key files[$BASEPATH/$i]:" $IP
        sed -i "s#_IP_#$IP#g" $BASEPATH/$i/*sh
        sed -i "s#_SSLPATH_#$SSLPATH#g" $BASEPATH/$i/*sh
done