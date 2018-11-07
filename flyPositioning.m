function [x, y, gender, geneticPool] = flyPositioning(flyPopulationSize,coordinates)
randPosNeg = [-1 1];
pos = randi(length(randPosNeg));
randomUnit = randPosNeg(pos);
gender=zeros(flyPopulationSize,1);
geneticPool=zeros(flyPopulationSize,1);
x=zeros(flyPopulationSize,1);
y=zeros(flyPopulationSize,1);
n=1;
    for i=1:flyPopulationSize
        run=randi([1 size(coordinates,1)]);
        x(i)=coordinates(run,1);
        y(i)=coordinates(run,2);
        n=n+1;
        gender(i)=randomUnit;
        geneticPool(i)=0;
    end
    
end
   