#!/bin/csh

#Submission script for altjob job
#This job calls type2script that include the definition of movement probabilities based on altitude grid provided in tiff file

#$ -pe smp 24         
#$ -N  altjob 	# Specify job name
#$ -t 1-1:1       #specify number of data input files
#$ -q long
#$ -r y

set shape=( SanDimasSubset.shp )
set alt=( DimasSubsetElevation.tif )
module load matlab

matlab -nodisplay -nosplash -nojvm -r "type2script('$shape[${SGE_TASK_ID}]','$alt[${SGE_TASK_ID}]');exit"
