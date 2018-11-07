function type1script(filename)
	gridType={3,filename,100,100};
	pb=0.0270;
	pd=0.089;
	numberOfKids=0;
	simulationTimeLength=1344;
	flyPopulationSize=500000;
	nmoves=1;
	flyrivertype1(gridType,pb,pd,numberOfKids,simulationTimeLength,flyPopulationSize,nmoves)
end