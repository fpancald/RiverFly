xmin=-Inf;
xmax=Inf;
ymin=150;
ymax=Inf;
popsize1=zeros(1,simulationTimeLength+1);
for i=1:simulationTimeLength+1
    for j=1:size(simdata{i},1)
        if simdata{i}(j,1)>xmin && simdata{i}(j,1)<xmax && simdata{i}(j,2)>ymin && simdata{i}(j,2)<ymax
            popsize1(i)=popsize1(i)+1;
        end
    end
end
figure(7)
plot(0:simulationTimeLength,popsize1)
f11=fit((0:simulationTimeLength)',popsize1','exp1')
f21=fit((0:simulationTimeLength)',popsize1','exp2')
hold on
plot(f11,(0:simulationTimeLength)',popsize1')
plot(f21,(0:simulationTimeLength)',popsize1')



xmin=-Inf;
xmax=Inf;
ymin=-Inf;
ymax=150;
popsize2=zeros(1,simulationTimeLength+1);
for i=1:simulationTimeLength+1
    for j=1:size(simdata{i},1)
        if simdata{i}(j,1)>xmin && simdata{i}(j,1)<xmax && simdata{i}(j,2)>ymin && simdata{i}(j,2)<ymax
            popsize2(i)=popsize2(i)+1;
        end
    end
end
figure(8)
plot(0:simulationTimeLength,popsize2)
f12=fit((0:simulationTimeLength)',popsize2','exp1')
f22=fit((0:simulationTimeLength)',popsize2','exp2')
hold on
plot(f12,(0:simulationTimeLength)',popsize2')
plot(f22,(0:simulationTimeLength)',popsize2')