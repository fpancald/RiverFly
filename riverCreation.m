function[river,riverRegion] =riverCreation(numberOfInstancesRiverSplits,regionRadiusFromCentralRiver)
[riverSplishSpashCoordinateSetXInFirstColumn,x,y,height,width]=gridTestHammyJammy(numberOfInstancesRiverSplits);%???
riverSplishSpashCoordinateSetXInFirstColumn;%needed? test?
dims=peak2peak(riverSplishSpashCoordinateSetXInFirstColumn);%river size based on both coordinates?
river = zeros(dims(2),dims(1));%order? integers?
set=size(river,1);%first river size, second dimension?

for theLoneAvengerRunningAcrossTheFieldOfZeros=1:size(riverSplishSpashCoordinateSetXInFirstColumn,1)
    river(dims(2)-riverSplishSpashCoordinateSetXInFirstColumn(theLoneAvengerRunningAcrossTheFieldOfZeros,2)+1,riverSplishSpashCoordinateSetXInFirstColumn(theLoneAvengerRunningAcrossTheFieldOfZeros,1)+dims(1)/2+1)=1;
end

riverRegion=zeros(dims(2)+2*regionRadiusFromCentralRiver+1,dims(1)+2*regionRadiusFromCentralRiver+1);

for i=1:size(river,1)
    for j=1:size(river,2)
        riverRegion(i+regionRadiusFromCentralRiver,j+regionRadiusFromCentralRiver)=river(i,j);
    end
end

n=find(riverRegion==1);
if regionRadiusFromCentralRiver>0
    for i=1:numel(n)
        for j=1:regionRadiusFromCentralRiver
            riverRegion(n(i)-j*size(riverRegion,1))=1;
            riverRegion(n(i)+j*size(riverRegion,1))=1;
        end
    end
else
    riverRegion=river;
end

daniel=[0 0];
k=1;
n=1;
splitPower=numberOfInstancesRiverSplits;
centerXValues=zeros(1);
centerXValues(1)=dims(1)/2+2;
for i0=size(riverRegion,1)-1:-1:12
    if 0==mod(i0-2,20)
        for centerXValueCounter=1:size(centerXValues,2)
            j0=centerXValues(centerXValueCounter);
            box=regionRadiusFromCentralRiver+10*2^(splitPower-1);
            slopeL=2^(splitPower-1);
            slopeR=-2^(splitPower-1);
            
            for i1=1:9
                
                for j1=j0-box:1:j0+box
                    
                    if j1>=0 && j1<=size(riverRegion,2)
                        
                        if slopeR*i1+j0-regionRadiusFromCentralRiver<=j1 && j1<=slopeR*i1+j0+regionRadiusFromCentralRiver && 0==mod(j1,1)
                            daniel(n,:)=[i0-i1 j1];
                            n=n+1;
                            
                        elseif slopeL*i1+j0-regionRadiusFromCentralRiver<=j1 && j1<=slopeL*i1+j0+regionRadiusFromCentralRiver && 0==mod(j1,1)
                            daniel(n,:)=[i0-i1 j1];
                            n=n+1;
                        end
                    end
                end
            end
        end
        place=1;
        for tailPointCounter=1:size(centerXValues)
            for holderSize=1:size(centerXValues,2)
                holder(place)=centerXValues(holderSize)-10*2^(splitPower-1);
                place=place+1;
                holder(place)=centerXValues(holderSize)+10*2^(splitPower-1);
                place=place+1;
            end
        end
        centerXValues=holder;
        k=k+1;
        splitPower=splitPower-1;
    end
    
end

for i=1:size(daniel,1)
    riverRegion(daniel(i,1),daniel(i,2))=1;
end

[rows,columns]=find(riverRegion==1);
coordinates=[columns rows];


% for i=1:size(coordinates,1)
%     scatter(columns-1,rows-regionRadiusFromCentralRiver-1)
% end

end

