function type6multiscript(shapefile,altfile,Ntask)
	eggtime=168;
	gridType={6,shapefile,altfile,eggtime};%shape+altitude+streamorder+eggs
	pb=0.0270;
	pd=0.089;
	numberOfKids=Ntask;
	simulationTimeLength=2688;
	flyPopulationSize=10000;
	nmoves=1;
	altprobcoeff=0.1;
	cutoffpop=100000;
	profileswitch=0;
	timingswitch=1;
	flyrivertype4(gridType,pb,pd,numberOfKids,simulationTimeLength,flyPopulationSize,nmoves,altprobcoeff,cutoffpop, profileswitch, timingswitch)
end