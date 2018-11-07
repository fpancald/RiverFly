function [hi,whatAreTheXCoordinatesOfThisRiverNode,whatAreTheYCoordinatesOfThisRiverNode,howTallThisSystemGonnaBeNow,howWideThisSystemGonnaBeNow] = gridTestHammyJammy(totalNumberOfRiverSplitsYouMadeHappenSilly,thisSwitchGonnaHappen)
% clf;
howTallThisSystemGonnaBeNow=20*totalNumberOfRiverSplitsYouMadeHappenSilly;
howWideThisSystemGonnaBeNow=10*2^(totalNumberOfRiverSplitsYouMadeHappenSilly+1);

leftestMostEndestMostPoint=-howWideThisSystemGonnaBeNow/2;
rightestMostrighteousostPoint=howWideThisSystemGonnaBeNow/2;
whatAreTheXCoordinatesOfThisRiverNode=zeros(1);
whatAreTheYCoordinatesOfThisRiverNode=zeros(1);
howManyCrazyMamasBeRunningRoundThisMotha=1;
howManyTimesTheRiverBeDividingMitoticallyAndStuff=0;

for y0=0:howTallThisSystemGonnaBeNow/(2*totalNumberOfRiverSplitsYouMadeHappenSilly):howTallThisSystemGonnaBeNow
    
    if 0==mod(y0,20)&&y0>0
        howManyTimesTheRiverBeDividingMitoticallyAndStuff=howManyTimesTheRiverBeDividingMitoticallyAndStuff+1;
        
    end
    
    for j=1:2^howManyTimesTheRiverBeDividingMitoticallyAndStuff
        whatAreTheXCoordinatesOfThisRiverNode(howManyCrazyMamasBeRunningRoundThisMotha)=leftestMostEndestMostPoint+(2*j-1)*(rightestMostrighteousostPoint-leftestMostEndestMostPoint)/(2^(howManyTimesTheRiverBeDividingMitoticallyAndStuff+1));
        whatAreTheYCoordinatesOfThisRiverNode(howManyCrazyMamasBeRunningRoundThisMotha)=y0;
        howManyCrazyMamasBeRunningRoundThisMotha=howManyCrazyMamasBeRunningRoundThisMotha+1;
        
        if mod(y0,20)==0
            for jOne=1:10
                whatAreTheXCoordinatesOfThisRiverNode(howManyCrazyMamasBeRunningRoundThisMotha)=whatAreTheXCoordinatesOfThisRiverNode(howManyCrazyMamasBeRunningRoundThisMotha-1);
                whatAreTheYCoordinatesOfThisRiverNode(howManyCrazyMamasBeRunningRoundThisMotha)=y0+jOne;
                howManyCrazyMamasBeRunningRoundThisMotha=howManyCrazyMamasBeRunningRoundThisMotha+1;
            end
        end
    end
    
end

hi=[whatAreTheXCoordinatesOfThisRiverNode' whatAreTheYCoordinatesOfThisRiverNode'];

% hold on;
% scatter(whatAreTheXCoordinatesOfThisRiverNode',whatAreTheYCoordinatesOfThisRiverNode','LineWidth',.5)
% daniel = hi;
% for powerset=1:splits
% power(powerset)=2^(powerset)-2;
% end
% power = 1;
% for ii=1:size(whatAreTheYCoordinatesOfThisRiverNode,2)
%     power;
%     if 0==mod(ii+1,10*(2^(power)+2))&&power<=totalNumberOfRiverSplitsYouMadeHappenSilly
%         power=power+1;
%     end
%     
%     for jj=ii+1:size(whatAreTheYCoordinatesOfThisRiverNode,2)
%         
%         if abs(whatAreTheXCoordinatesOfThisRiverNode(ii)-whatAreTheXCoordinatesOfThisRiverNode(jj))==0
%             plot([hi(ii,1); hi(jj,1)], [hi(ii,2); hi(jj,2)]);
%             
%         elseif abs(whatAreTheYCoordinatesOfThisRiverNode(ii)-whatAreTheYCoordinatesOfThisRiverNode(jj))==(howTallThisSystemGonnaBeNow/(2*totalNumberOfRiverSplitsYouMadeHappenSilly)) && (abs(whatAreTheXCoordinatesOfThisRiverNode(ii)-whatAreTheXCoordinatesOfThisRiverNode(jj))<=(rightestMostrighteousostPoint-leftestMostEndestMostPoint)/(2^(power+1)))&& mod(whatAreTheYCoordinatesOfThisRiverNode(ii)/10,2)==1
%             plot([hi(ii,1); hi(jj,1)], [hi(ii,2); hi(jj,2)],'linewidth',0.1);
%             hiThere=ii;
%             byeThere=jj;
%         else
%             
%         end
%     end
%     %         hi(ii,:)=[];
% end
% 
% hold off;

end
