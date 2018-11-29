function[riverWeight,rowsTop,columnsTop]=weight(river)
[rowsTop,columnsTop] = ind2sub(size(river),find(river == 1));
riverWeight=cell(size(river,1),size(river,2));
for i=1:size(riverWeight,1)
    for j=1:size(riverWeight,2)
        riverWeight{i,j}=zeros(2,9);
    end
end


for i=1:size(rowsTop,1)
    levelWeight=sum(sum(river((rowsTop(i)-1):(rowsTop(i)+1),(columnsTop(i)-1):(columnsTop(i)+1))));
    for jj=1:3
        for ii=1:3
            riverWeight{rowsTop(i),columnsTop(i)}(1,(ii+3*(jj-1)))=river(rowsTop(i)-2+ii,columnsTop(i)-2+jj)/levelWeight;
        end
    end
    
    for iii=1:9
       riverWeight{rowsTop(i),columnsTop(i)}(2,iii)=sum(riverWeight{rowsTop(i),columnsTop(i)}(1,1:iii));
    end
end
