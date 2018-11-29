%Amount of eggs to start the simulation
eggs=5000;
bottomWeight=2;
numberOfSplits=3;
widthOfRiver=2;
time=100;
riverChoice=2;
% profile on -history
%create the river
[riverPlaceholder,riverRegionPlaceholder]=riverCreation(numberOfSplits,widthOfRiver);
regionRadiusFromCentralRiver=2;
depth=[1,1];
if riverChoice==1
    riverHolder=riverRegionPlaceholder.*reshape(depth, 1, 1, []);
else
    riverHolder=readshape2('SanDimasSubset',5,1);
end

river=zeros(size(riverHolder,1)+2,size(riverHolder,2)+2);
for level=1:2
    for i=1:size(riverHolder,1)
        for j=1:size(riverHolder,2)
            river(i+1,j+1)=riverHolder(i,j);
        end
    end
end

river;
[riverWeight,rows,columns]=weight(river);

% riverHead=river(rows(1:10),columns);
%
movers=zeros(eggs,3,1);
ii=randi(size(rows,1),size(movers,1),1);

%randomizes position for the first step
for i=1:size(movers,1)
    movers(i,1:3)=[columns(ii(i)) rows(ii(i))  1];
%     movers(i,[1:3])=[10 5 1];
end
timeslice={zeros(eggs,2)};
histo={zeros(size(riverWeight,2),size(riverWeight,1))};

%Eggs movement
%tic
for t=1:time
    movingIndices=rand(eggs,2);
    for i=1:size(movers,1)
        for j=1:9
            if movingIndices(i,2)<riverWeight{movers(i,2),movers(i,1)}(2,j)
                movers(i,2)=movers(i,2)-1+mod(j-1,3);
                movers(i,1)=movers(i,1)-1+floor((j-1)./3);
                break;
            end
        end
    end
    timeslice{t}=movers(:,1:2);
    gridholder=zeros(size(riverWeight,2),size(riverWeight,1));
    for j=1:size(movers,1)
        gridholder(movers(j,2),movers(j,1))=gridholder(movers(j,1),movers(j,2))+1;
    end
    histo{t}=gridholder;
end
%toc

% tic
for i=1:time
    M=size(histo{i},1);
    N=size(histo{i},2);
    clf
    hold on
    
    %     axis([0 10 0 10]);
    
     subplot(1,2,1);
    contour(river(:,:));
    axis([0 size(riverWeight,2) 0 size(riverWeight,1)]);
    scatter(timeslice{i}(:,1),timeslice{i}(:,2))
    grid on
    
    
    subplot(1,2,2);
    HMobj = contour(histo{i});
    mesh([0:1:N-1],[0:1:M-1],histo{i}); % Three dimensional plot
    xlabel('State'); ylabel('Time,n');zlabel('Probability');
    view(M,N)
    pause(10/60)
    hold off
end
% profsave
% p = profile('info')