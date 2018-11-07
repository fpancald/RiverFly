function [landGrid_prob,altGrid]=Alt_gridprob(altLandGrid)
    landGrid_prob=cell(size(altLandGrid,2),size(altLandGrid,1));
%     alt_max=max(max(landGrid));
%     alt_min=min(min(landGrid));
%     alt_range=alt_min:alt_max;
    for i=2:size(altLandGrid,2)-1
        for j=2:size(altLandGrid,1)-1
            n=1;
            for ii=i-1:1:i+1
                for jj=j-1:1:j+1
                    landGrid_prob{i,j}(1,n)=altLandGrid(jj,ii);
                    n=n+1;
                end
            end
            max_LGij=max(landGrid_prob{i,j});
            min_LGij=min(landGrid_prob{i,j});
            altGrid{i,j}=landGrid_prob{i,j};
            landGrid_prob{i,j}=(max_LGij-landGrid_prob{i,j});
            sum_LGij=sum(landGrid_prob{i,j});
            landGrid_prob{i,j}=0.5/9+0.5*(landGrid_prob{i,j})/sum_LGij;

        end
    end
end