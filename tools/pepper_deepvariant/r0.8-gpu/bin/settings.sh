#!/usr/bin/env bash

if [ ! $(command -v singularity) ]; then
        module load singularity
fi

VER=r0.8-gpu
PKG=pepper_deepvariant
PROGRAM=settings.sh
DIRECTORY=/cluster/tufts/biocontainers/images
IMAGE=kishwars_pepper_deepvariant:r0.8-gpu.sif
ENTRYPOINT_ARGS="env LANG=C"

## Determine Nvidia GPUs (to pass coresponding flag to Singularity)
if [[ $(nvidia-smi -L 2>/dev/null) ]]
then
        OPTIONS="--nv"
fi
	
singularity exec $OPTIONS $DIRECTORY/$IMAGE $ENTRYPOINT_ARGS $PROGRAM "$@"
