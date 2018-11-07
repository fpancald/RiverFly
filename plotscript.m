figure(1)
cont=contour(landGrid);
hold on   
axis([0 size(landGrid,2) 0 size(landGrid,1)]);
for i=1:simulationTimeLength+1
    if ~isempty(simdata{i})
        scat=scatter(simdata{i}(:,1),simdata{i}(:,2),'MarkerEdgeColor','b');
        grid on
        pause(10/60)
        if i~=simulationTimeLength+1
            delete(scat)
        end
    else
        break;
    end
end
hold off

deathmap=zeros(size(landGrid));
for i=1:size(deathInformation,1)
    if deathInformation(i,7)~=0 && deathInformation(i,6)~=0
        deathmap(deathInformation(i,7),deathInformation(i,6))=deathmap(deathInformation(i,7),deathInformation(i,6))+1;
    end
end
figure(2)
imagesc(deathmap)
hold on
scatter(deathInformation(:,6),deathInformation(:,7))
contour(landGrid)
colormap('jet')

birthmap=zeros(size(landGrid));
for i=1:size(deathInformation,1)
    if deathInformation(i,5)~=0 && deathInformation(i,4)~=0
        birthmap(deathInformation(i,5),deathInformation(i,4))=birthmap(deathInformation(i,5),deathInformation(i,4))+1;
    end
end
for i=1:size(simdata{simulationTimeLength+1},1)
    if ~isempty(simdata{simulationTimeLength+1})
        birthmap(simdata{simulationTimeLength+1}(i,7),simdata{simulationTimeLength+1}(i,6))=birthmap(simdata{simulationTimeLength+1}(i,7),simdata{simulationTimeLength+1}(i,6))+1;
    end
end
figure(3)
imagesc(birthmap)
hold on
scatter(deathInformation(:,4),deathInformation(:,5))
if ~isempty(simdata{simulationTimeLength+1})
    scatter(simdata{simulationTimeLength+1}(i,6),simdata{simulationTimeLength+1}(i,7))
end
contour(landGrid)
colormap('jet')

popsize=zeros(1,simulationTimeLength+1);
for i=1:simulationTimeLength+1
    popsize(i)=size(simdata{i},1);
end
figure(4)
plot(0:simulationTimeLength,popsize)
f1=fit((0:simulationTimeLength)',popsize','exp1');
f2=fit((0:simulationTimeLength)',popsize','exp2');
disp(f1);
disp(f2);
hold on
plot(f1,(0:simulationTimeLength)',popsize')
plot(f2,(0:simulationTimeLength)',popsize')

popdens=zeros(size(landGrid));
endsteps=672;
for t=simulationTimeLength+1:-1:max(simulationTimeLength+1-endsteps,1)
    for i=1:size(simdata{t},1)
        popdens(simdata{t}(i,2),simdata{t}(i,1))=popdens(simdata{t}(i,2),simdata{t}(i,1))+1;
    end
end
figure(5)
hold on
imagesc(popdens)
contour(landGrid,[1,1],'LineColor','y','LineWidth',0.01)
colormap('jet')


