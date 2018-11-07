function [flies]=move_v3(flies,landGrid,landGrid_prob,flyPopulationSize,coordinates,t)%water,land,death)
mover = rand(size(flies,1),1);

slots=zeros(size(flies,1),9);
for i=1:size(flies,1)
    %movement counter increase
    flies(i,5)=flies(i,5)+1;
    
    %check boundary conditions, and create prob. grid if ok
    if le(2,flies(i,1)) && le(2,flies(i,2)) && le(flies(i,1),size(landGrid,2)-1) && le(flies(i,2),size(landGrid,1)-1)
        slots(i,:)=landGrid_prob{flies(i,1),flies(i,2)};
        
        
        
    %boundary replaced with new agent 
    else %right now if one goes out of bound it's killed

        flies(i,1)=Inf;
        flies(i,2)=Inf;
        flies(i,3)=0;
        flies(i,4)=0;
        flies(i,5)=0;
        flies(i,6)=flies(i,1);
        flies(i,7)=flies(i,2);
    end
    
    %ok so these coordinates are all jacked up.  The first column of flies
    %represents the x-values of it's position, which correspond with the
    %second column of the landgrid matrix, which has the added fun of
    %having the positive y-axis oriented in the downward position.  Slots
    %is reading from top left to bottom right by scanning down a column and
    %then moving right once done.
    if flies(i,1)~=Inf
        holder=0;
        for iii=1:3
            for jjj=1:3
                psum=holder+slots(i,3*(iii-1)+jjj);
                if le(holder,mover(i)) && le(mover(i),psum)%speedup check results
    %             if le(holder,mover(i)) && le(mover(i),sum(slots(i,1:3*(iii-1)+jjj)))
                    flies(i,1)=flies(i,1)-2+iii;%check orientation
                    flies(i,2)=flies(i,2)+2-jjj;     
                end
    %             holder=sum(slots(i,1:3*(iii-1)+jjj));
                holder=psum;%speedup check-compare results
            end
        end
    end
end

end