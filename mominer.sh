#!/bin/bash
CONFIG_FILE="/home/${USER}/.config/mominer/mominer.conf"

if [[ -f "${CONFIG_FILE}" ]];then
	source "${CONFIG_FILE}"
else
	echo "Setting default values, mining for author of mominer"

	MINING_POOL="us-west.minexmr.com:443"
	XMRPATH=""
	RECADDRESS=""
	DONATE=0
	CPU_THREADS="$(nproc)"
	CUDA="off"
	OPENCL="off"

	MINER_NAME="sam"
fi

if [[ "${CUDA}" = "on" ]];then
	sudo "${XMRPATH}"/xmrig --cuda --donate-level "${DONATE}" -o "{$MINING_POOL}" -u "${RECADDRESS}" -k --tls --rig-id "${MINER_NAME}"

elif [[ "${OPENCL}" = "on" ]];then
	sudo "${XMRPATH}"/xmrig --opencl --donate-level "${DONATE}" -o "${MINING_POOL}" -u "${RECADDRESS}" -k --tls --rig-id "${MINER_NAME}"

else
	sudo "${XMRPATH}"/xmrig -t "${CPU_THREADS}" --donate-level "${DONATE}" -o "${MINING_POOL}" -u "${RECADDRESS}" -k --tls --rig-id "${MINER_NAME}"
fi
	
