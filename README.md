# chia_rpc_scripts

Simple shell scripts to extract basic information from chia blockchain client.

The directories the scripts are located reflect the service type they are connecting to.

## Installation

### Clone Repo
```
git clone https://github.com/neurosis69/chia_rpc_scripts.git
```
### Setup Prerequisites

- Scripts can be setup for local or remote rpc calls. 

- Local Setup expects to be run as chia OS User.

- If you use remote rpc calls, than additional configuration needs to be done to expose the rpc ports to your LAN.

    [Check the official note how to achieve that.](https://github.com/Chia-Network/chia-blockchain/wiki/Connecting-the-UI-to-a-remote-daemon)

##### Ports used

- Full Node: 8555

- Farmer: 8559

- Harvester: 8560

- Wallet: 9256

### Setup

```
cd chia_rpc_scripts
chmod u+x setup.sh
./setup.sh
```

##### Example for Local Setup
```
user@host:~/chia_rpc_scripts$ ./setup.sh

Enter setup type (local/remote) [Default: local]: local

```


##### Example for Remote Setup
```
user@host:~/chia_rpc_scripts$ ./setup.sh

Enter setup type (local/remote) [Default: local]: remote


#####################################
                farmer
#####################################
Enter IP address of farmer: 192.168.1.123
Enter path to SSL cert/key files [Default: /home/user/.chia]: /home/user/.chia


#####################################
                wallet
#####################################
Enter IP address of wallet: 192.168.1.124
Enter path to SSL cert/key files [Default: /home/user/.chia]: /home/user/.chia


#####################################
                full_node
#####################################
Enter IP address of full_node: 192.168.1.124
Enter path to SSL cert/key files [Default: /home/user/.chia]: /home/user/.chia


#####################################
                harvester
#####################################
Enter IP address of harvester: 192.168.1.125
Enter path to SSL cert/key files [Default: /home/user/.chia]: /home/user/.chia
```

