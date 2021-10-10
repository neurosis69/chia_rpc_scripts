#!/bin/bash
OSUSERHOME=`echo ~`
SETUPSCRIPT=$(readlink -f "$0")
BASEPATH=$(dirname "$SETUPSCRIPT")
CSVPATH=${BASEPATH}/csv

#Default Timeouts (in seconds)
CONNECT_TIMEOUT=10
MAX_TIMEOUT=20

#declare array of chia service types
declare -a SERVICETYPES=("farmer" "wallet" "full_node" "harvester")

#read if local/remote setup
echo -e "\n"
read -p "Enter setup type (local/remote) [Default: local]: " SETUPTYPE
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
		#replace connect timeout in shell scripts
		sed -s -i "s#_CONNTIMEOUT_#$CONNECT_TIMEOUT#g" $BASEPATH/$i/*sh
		#replace max timeout in shell scripts
		sed -s -i "s#_MAXTIMEOUT_#$MAX_TIMEOUT#g" $BASEPATH/$i/*sh
		#change execute privs
		chmod u+x $BASEPATH/$i/*sh
	done
} ||
{
	for i in  ${SERVICETYPES[@]}; do
		echo -e "\n"
		echo -e "#####################################"
		echo -e "                $i                   "
		echo -e "#####################################"
		read -p "Enter IP address of $i: " IP
		read -p "Enter path to SSL cert/key files for $i [Default: $OSUSERHOME/.chia]: " SSLPATH
		SSLPATH=${SSLPATH:-$OSUSERHOME/.chia}
		#replace IP in shell scripts
		sed -s -i "s#_IP_#$IP#g" $BASEPATH/$i/*sh
		#replace ssl path in shell scripts
		sed -s -i "s#_SSLPATH_#$SSLPATH#g" $BASEPATH/$i/*sh
		#replace connect timeout in shell scripts
		sed -s -i "s#_CONNTIMEOUT_#$CONNECT_TIMEOUT#g" $BASEPATH/$i/*sh
		#replace max timeout in shell scripts
		sed -s -i "s#_MAXTIMEOUT_#$MAX_TIMEOUT#g" $BASEPATH/$i/*sh
		#change execute privs
		chmod u+x $BASEPATH/$i/*sh
	done
}

#Pool related scripts
sed -s -i "s#_CSVPATH_#$CSVPATH#g" $BASEPATH/pool_api/spacefarmers_api/*sh
sed -s -i "s#_CONNTIMEOUT_#$CONNECT_TIMEOUT#g" $BASEPATH/pool_api/*sh
sed -s -i "s#_MAXTIMEOUT_#$MAX_TIMEOUT#g" $BASEPATH/pool_api/*sh
sed -s -i "s#_CONNTIMEOUT_#$CONNECT_TIMEOUT#g" $BASEPATH/pool_api/spacefarmers_api/*sh
sed -s -i "s#_MAXTIMEOUT_#$MAX_TIMEOUT#g" $BASEPATH/pool_api/spacefarmers_api/*sh
chmod u+x $BASEPATH/pool_api/*sh
chmod u+x $BASEPATH/pool_api/spacefarmers_api/*sh
