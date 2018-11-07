function [landGrid_prob]=gridprob(landGrid,landc,waterc)
    landGrid_prob=cell(size(landGrid,2),size(landGrid,1));
    for i=2:size(landGrid,2)-1
        for j=2:size(landGrid,1)-1
            n=1;
            for ii=i-1:1:i+1
                for jj=j-1:1:j+1
                    if landGrid(jj,ii)==0
                        landGrid_prob{i,j}(1,n)=landc;
                    elseif landGrid(jj,ii)==1
                        landGrid_prob{i,j}(1,n)=waterc;
                    else
                        
                    end
                    n=n+1;
                end
            end
            landGrid_prob{i,j}=landGrid_prob{i,j}/sum(landGrid_prob{i,j});
        end
    end
end