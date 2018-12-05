#!/bin/csh

#Submission script for type6 simulation


#$ -l h=!q16copt120
#$ -q long
#$ -pe smp 24         
#$ -N  type6 	# Specify job name
#$ -t 1-4:1       #specify number of data input files
#$ -q long
#$ -r y

set shape=( SanDimasSubset.shp Vent12.shp vent13.shp Vent14.shp)
set alt=( DimasSubsetElevation.tif Vent12.tif Vent13.tif vent1_41.tif)
module load matlab

matlab -nodisplay -nosplash -nojvm -r "type6simscript('$shape[${SGE_TASK_ID}]','$alt[${SGE_TASK_ID}]');exit"
