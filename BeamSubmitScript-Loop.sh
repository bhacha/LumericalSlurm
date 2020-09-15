#!/bin/sh
#This file is called submit-script.sh
#SBATCH --partition=univ        # default "univ", if not specified
#SBATCH --time=3-12:30:00       # run time in days-hh:mm:ss
#SBATCH --nodes=5           # require 5 nodes
#SBATCH --ntasks-per-node=5            # (by default, "ntasks"="cpus")
#SBATCH --mem-per-cpu=4000      # RAM per CPU core, in MB (default 4 GB/core)
#SBATCH --error=/home/hacha/BeamPropagation/BeamPropagationLogs/Errors/job.%J.err
#SBATCH --output=/home/hacha/BeamPropagation/BeamPropagationLogs/Logs/job.%J.out
#Make sure to change the above two lines to reflect your appropriate
# file locations for standard error and output

#Now list your executable command (or a string of them).
module load lumerical


#This for loop will loop over any .fsp file in the directory and assign it to FILE. The "do" line then runs lumerical on FILE
for FILE in /home/hacha/BeamPropagation/Gaussian;
do /opt/lumerical/fdtd/mpich2/nemesis/bin/mpiexec fdtd-engine-mpich2nem $FILE -nw -fullinfo;
done
