#!/bin/csh

#Submission script for multibr job
#This job calls type3script that allows to specify the numberofkids through the task umber.


#$ -l h=!q16copt120
#$ -q long
#$ -pe smp 24         
#$ -N  multibr 	# Specify job name
#$ -t 1-50:1       #specify number of data input files
#$ -q long
#$ -r y

set shape=( SanDimasSubset.shp )
set alt=( DimasSubsetElevation.tif )
module load matlab

matlab -nodisplay -nosplash -nojvm -r "type6multiscript('$shape[1]','$alt[1]',${SGE_TASK_ID});exit"
