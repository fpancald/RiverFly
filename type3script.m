function type3script(shapefile,altfile,Ntask)
	gridType={4,shapefile,altfile};%shape+altitude
	pb=0.0270;
	pd=0.089;
	numberOfKids=Ntask;
	simulationTimeLength=672;
	flyPopulationSize=10000;
	nmoves=1;
	flyrivertype2(gridType,pb,pd,numberOfKids,simulationTimeLength,flyPopulationSize,nmoves)
end