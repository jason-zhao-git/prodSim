#!/bin/bash

# Run qstat -s r and check if "H1" is present in the output
if qstat -s r | grep -q "H1"; then
    echo "Job 'H1' is running."

else
    echo "Job 'H1' is not running."
fi

if qstat -s r | grep -q "H1" || qstat | grep qw | grep -q "fake_job1"; then
    echo "Job 'Hfj1' is queing."

else
    echo "Job 'H1' is not queing."
fi

#python fake_exit.py

# ----- test exit code intake -------#
exit_code=$?

echo $exit_code
###if [ $exit_code -eq 73 ]; then
#    echo "The Python script exited with code 73."
#else
#    echo "The Python script did not exit with code 73."
#fi

#exit_code=$(qsub -q gpu.q -terse fake_job.sh | awk '{print $1}')
#echo $exit_code

# ------ test replica and chmod ------ #

#./fake_job.sh 0
#cp fake_job.sh fake_job1.sh
#chmod +x fake_job1.sh
#./fake_job1.sh 1

# ------- test shared pipe communication --------#
pipe="test_pipe.txt"

echo "$exit_code" > "$pipe"
echo $(cat "$pipe")

job_id=$(qsub fake_job1.sh)
job_id=$(echo $job_id | grep -oE '[0-9]+')
echo "Submitted job with ID: $job_id"
if qstat -s r | grep -q "$job_id" || qstat | grep qw | grep -q "$job_id"; then
    echo "Job 'Hfj1id' is queing."

else
    echo "Job 'H1id' is not queing."
fi