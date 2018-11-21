function type2script(shapefile,altfile)
	gridType={4,shapefile,altfile};
	pb=0;
	pd=0;
	numberOfKids=0;
	simulationTimeLength=6720;
	flyPopulationSize=10000;
	nmoves=1;
	flyrivertype2(gridType,pb,pd,numberOfKids,simulationTimeLength,flyPopulationSize,nmoves)
end