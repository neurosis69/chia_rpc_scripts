#!/bin/bash
OSUSERHOME=`echo ~`
SETUPSCRIPT=$(readlink -f "$0")
BASEPATH=$(dirname "$SETUPSCRIPT")
echo $BASEPATH
#declare array of chia service types
declare -a SERVICETYPES=("farmer" "wallet" "full_node" "harvester")

#read if local/removte setup
read -p $'\nEnter setup type (local/remote) [Default: local]:\n' SETUPTYPE
SETUPTYPE=${SETUPTYPE:-"local"}

#exit if unknown setuptype was entered
[[ ! $SETUPTYPE == "local" && ! $SETUPTYPE == "remote" ]] && echo "Allowed Setuptypes: local, remote" && exit 100

[[ $SETUPTYPE == "local" ]] && 
{
	for i in  ${SERVICETYPES[@]}; do
		SSLPATH=$BASEPATH/.chia/mainnet/config/ssl/$i
		#replace IP in shell scripts
		sed -s -i "s#_IP_#localhost#g" $BASEPATH/$i/*sh
		#replace ssl path in shell scripts
		sed -s -i "s#_SSLPATH_#$SSLPATH#g" $BASEPATH/$i/*sh
	done
} ||
{
	for i in  ${SERVICETYPES[@]}; do
		echo -e "\n###################################"
		echo -e "#               $i                  #"
		echo -e "#####################################"
		read -p 'Enter IP address of $i: ' IP
		read -p $'Enter path to SSL cert/key files for ${i} [Default: $OSUSERHOME/.chia]:\n' SSLPATH
		SSLPATH=${SSLPATH:-$OSUSERHOME/.chia}
		#replace IP in shell scripts
		sed -s -i "s#_IP_#$IP#g" $BASEPATH/$i/*sh
		#replace ssl path in shell scripts
		sed -s -i "s#_SSLPATH_#$SSLPATH#g" $BASEPATH/$i/*sh
	done
}