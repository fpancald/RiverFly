function[flies,counter]=sorting(input,counter)
aliveBeginning=counter;
holder=zeros(1,size(input,2));
for i=2:size(input,1)
    j=i;
    if input(i,1)==-11&&input(i,2)==-11
        holder=input(i,:);
        
       while j > 1
           input(j,:)=input(j-1,:);
           j=j-1;
       end
       input(aliveBeginning,:)=holder;
       aliveBeginning=aliveBeginning+1;
    else
    end
end
         flies(:,:)=input(:,:);  
         counter=aliveBeginning;
end