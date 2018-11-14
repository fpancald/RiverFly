#!/bin/csh

#Submission script for alttest job
#This job calls type2scriptalt that makes flies immortal and nonrepriducing. The flies just move.
#This allows to check how the movement probabilities based on altitude influece the distribution of flies after a number of timesteps.


#$ -l h=!q16copt120
#$ -q long
#$ -pe smp 8         
#$ -N  alttest 	# Specify job name
#$ -t 1-1:1       #specify number of data input files
#$ -q long
#$ -r y

set shape=( SanDimasSubset.shp )
set alt=( DimasSubsetElevation.tif )
module load matlab

matlab -nodisplay -nosplash -nojvm -r "type2scriptalt('$shape[${SGE_TASK_ID}]','$alt[${SGE_TASK_ID}]');exit"
