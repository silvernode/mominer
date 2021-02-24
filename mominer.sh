#!/bin/bash
XMRPATH="/home/mollusk/git/hub/xmrig/build"
RECADDRESS="8AnnAFboz6aJxrzdPN4zbvWunXmPLNZ8Q89xRUDw8GZLL6DexzwJE7Hg2rPwnCegRaiLa3CRh3wkSCN7JkvRFBRx1iZiSHd"
DONATE=0
CPU_THREADS="6"
CUDA="off"
OPENCL="off"

MINER_NAME="ryhat"

if [[ "${CUDA}" = "on" ]];then
	sudo "${XMRPATH}"/xmrig --cuda --donate-level "${DONATE}" -o us-west.minexmr.com:443 -u "${RECADDRESS}" -k --tls --rig-id "${MINER_NAME}"

elif [[ "${OPENCL}" = "on" ]];then
	sudo "${XMRPATH}"/xmrig --opencl --donate-level "${DONATE}" -o us-west.minexmr.com:443 -u "${RECADDRESS}" -k --tls --rig-id "${MINER_NAME}"

else
	sudo "${XMRPATH}"/xmrig -t "${CPU_THREADS}" --donate-level "${DONATE}" -o us-west.minexmr.com:443 -u "${RECADDRESS}" -k --tls --rig-id "${MINER_NAME}"
fi
	
