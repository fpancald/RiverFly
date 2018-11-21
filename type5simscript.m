function type4simscript(shapefile,altfile)
	gridType={5,shapefile,altfile};%shape+altitude+streamorder
	pb=0.0270;
	pd=0.089;
	numberOfKids=12;
	simulationTimeLength=672;
	flyPopulationSize=10000;
	nmoves=1;
	altprobcoeff=0.1;
	cuttoffpop=100000;
	profileswitch=0;
	timingswitch=1;
	flyrivertype3(gridType,pb,pd,numberOfKids,simulationTimeLength,flyPopulationSize,nmoves,altprobcoeff,cuttoffpop, profileswitch, timingswitch)
end