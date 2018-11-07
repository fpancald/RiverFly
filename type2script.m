function type2script(shapefile,altfile)
	gridType={4,shapefile,altfile};
	pb=0.0270;
	pd=0.089;
	numberOfKids=18;
	simulationTimeLength=672;
	flyPopulationSize=10000;
	nmoves=1;
	flyrivertype2(gridType,pb,pd,numberOfKids,simulationTimeLength,flyPopulationSize,nmoves)
end