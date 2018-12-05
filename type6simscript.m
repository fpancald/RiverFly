function type6simscript(shapefile,altfile)
	eggtime=24;
	gridType={6,shapefile,altfile,eggtime};%shape+altitude+streamorder+eggs
	pb=0.0270;
	pd=0.089;
	numberOfKids=12;
	simulationTimeLength=480;
	flyPopulationSize=10000;
	nmoves=1;
	altprobcoeff=0.1;
	cutoffpop=100000;
	profileswitch=0;
	timingswitch=1;
	flyrivertype4(gridType,pb,pd,numberOfKids,simulationTimeLength,flyPopulationSize,nmoves,altprobcoeff,cutoffpop, profileswitch, timingswitch)
end