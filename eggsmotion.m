function[eggs]=eggsmotion(eggs,landGridWeight)
	movingIndices=rand(size(eggs,1),1);
	for i=1:size(eggs,1)
        for j=1:9
            if movingIndices(i)<landGridWeight{eggs(i,2),eggs(i,1)}(2,j)
                eggs(i,2)=eggs(i,2)-1+mod(j-1,3);
                eggs(i,1)=eggs(i,1)-1+floor((j-1)./3);
                break;
            end
        end
    end
	%size(eggs,1)
	%size(eggs,2)
	eggs(:,7)=eggs(:,7)+1;
end