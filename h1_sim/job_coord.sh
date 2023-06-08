#!/bin/bash

job_name="H1"
job_file="job.sh"
restart_file="array.sh"
pipe="shared_pipe.txt"

echo 0 > "$pipe"
qsub -q gpu.q "$job_file"

exit_code=0

while [ $exit_code -ne 73 ]; do
    if qstat -s r | grep -q "$job_name" || qstat | grep qw | grep -q "$job_name"; then
        sleep 20
    else
        qsub -q gpu.q "$restart_file"
    fi
    
    exit_code=$(cat "$pipe")
done

echo 0 > "$pipe"