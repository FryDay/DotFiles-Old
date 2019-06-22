#!/bin/sh

nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total --format=csv,noheader,nounits | awk '{ printf "GPU%:%s Mem%:%.0f\n", ""$1"", (($2/$3)*100)}'
