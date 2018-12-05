function type4simscript(shapefile,altfile)
	gridType={4,shapefile,altfile};%shape+altitude
	pb=0.0270;
	pd=0.089;
	numberOfKids=12;
	simulationTimeLength=672;
	flyPopulationSize=10000;
	nmoves=1;
	altprobcoeff=0.1;
	cutoffpop=100000;
	profileswitch=0;
	timingswitch=1;
	flyrivertype3(gridType,pb,pd,numberOfKids,simulationTimeLength,flyPopulationSize,nmoves,altprobcoeff,cutoffpop, profileswitch, timingswitch)
end