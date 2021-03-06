#!/bin/bash
CONFIG_FILE="/home/${USER}/.config/mominer/mominer.conf"

if [[ -f "${CONFIG_FILE}" ]];then
	source "${CONFIG_FILE}"
else
	echo "Setting default values, mining for author of mominer"

	MINING_POOL="us-west.minexmr.com:443"
	XMRPATH=""
	RECADDRESS="8AnnAFboz6aJxrzdPN4zbvWunXmPLNZ8Q89xRUDw8GZLL6DexzwJE7Hg2rPwnCegRaiLa3CRh3wkSCN7JkvRFBRx1iZiSHd"
	DONATE=0
	CPU_THREADS="$(nproc)"
	CUDA="off"
	OPENCL="off"

	MINER_NAME="mominer"
fi

if [[ -z "${XMRPATH}" ]];then
	echo "The 'XMPATH' setting is empty"
	echo "Please change it to the location of your 'xmrig' executable binary"
	exit 1
fi

if [[ "${CUDA}" = "on" ]];then
	sudo "${XMRPATH}"/xmrig --cuda --donate-level "${DONATE}" -o "{$MINING_POOL}" -u "${RECADDRESS}" -k --tls --rig-id "${MINER_NAME}"

elif [[ "${OPENCL}" = "on" ]];then
	sudo "${XMRPATH}"/xmrig --opencl --donate-level "${DONATE}" -o "${MINING_POOL}" -u "${RECADDRESS}" -k --tls --rig-id "${MINER_NAME}"

else
	sudo "${XMRPATH}"/xmrig -t "${CPU_THREADS}" --donate-level "${DONATE}" -o "${MINING_POOL}" -u "${RECADDRESS}" -k --tls --rig-id "${MINER_NAME}"
fi
	
