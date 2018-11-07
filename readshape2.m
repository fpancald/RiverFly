function [landGrid]=readshape2(filename,res,buffer)
% produce landGrid from shapefile

    shp_res = shaperead(filename);
    numseg=length(shp_res);
    k=0;
    for i=1:numseg
        numpts=length(shp_res(i).X);
        k=k+numpts;
    end
    xx=zeros(1,k);
    yy=zeros(1,k);
    k=0;
    for i=1:numseg
        numpts=length(shp_res(i).X);
        for j=1:numpts
            k=k+1;
            xx(k)=shp_res(i).X(j);
            yy(k)=shp_res(i).Y(j);
            if j>1 && ~isnan(xx(k))
                d=norm([xx(k) yy(k)]-[xx(k-1) yy(k-1)]);
                if d>res
                    nseg=ceil(d/res)+1;
                    tempx=linspace(xx(k-1),xx(k),nseg);
                    tempy=linspace(yy(k-1),yy(k),nseg);
                    xx(k-1:k+nseg-2)=tempx;
                    yy(k-1:k+nseg-2)=tempy;
                    k=k+nseg-2;
                end
            end
        end
    end
    maxx=max(xx);
    minx=min(xx);
    maxy=max(yy);
    miny=min(yy);

    dx=maxx-minx;
    dy=maxy-miny;
    numx=round(dx/res);
    numy=round(dy/res);
    landGrid=zeros(numy+2*buffer,numx+2*buffer);
    xx=xx-minx;
    yy=yy-miny;
%     k=0;
%     for i=1:numseg
%         numpts=length(shp_res(i).X);
%         for j=1:numpts
%             k=k+1;
    for k=1:length(xx)
            if ~isnan(xx(k))
%                 [round(xx(k)/res)+buffer,round(yy(k)/res)+buffer]
                landGrid(round(yy(k)/res)+buffer,round(xx(k)/res)+buffer)=1;
            end
    end
%         end
%     end
% end
