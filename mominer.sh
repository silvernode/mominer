#!/bin/bash
XMRPATH=""
RECADDRESS=""
DONATE=0
CPU_THREADS="$(nproc)"
CUDA="off"
OPENCL="off"

MINER_NAME="sam"

if [[ "${CUDA}" = "on" ]];then
	sudo "${XMRPATH}"/xmrig --cuda --donate-level "${DONATE}" -o us-west.minexmr.com:443 -u "${RECADDRESS}" -k --tls --rig-id "${MINER_NAME}"

elif [[ "${OPENCL}" = "on" ]];then
	sudo "${XMRPATH}"/xmrig --opencl --donate-level "${DONATE}" -o us-west.minexmr.com:443 -u "${RECADDRESS}" -k --tls --rig-id "${MINER_NAME}"

else
	sudo "${XMRPATH}"/xmrig -t "${CPU_THREADS}" --donate-level "${DONATE}" -o us-west.minexmr.com:443 -u "${RECADDRESS}" -k --tls --rig-id "${MINER_NAME}"
fi
	
