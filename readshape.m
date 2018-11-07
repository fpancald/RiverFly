function [landGrid]=readshape(filename,res,buffer)
% produce landGrid from shapefile

    shp_res = shaperead(filename);
    numseg=length(shp_res);
    maxx=-Inf;
    minx=Inf;
    maxy=-Inf;
    miny=Inf;
    mind=Inf;
    for i=1:numseg
        x1=shp_res(i).BoundingBox(1,1);
        x2=shp_res(i).BoundingBox(2,1);
        y1=shp_res(i).BoundingBox(1,2);
        y2=shp_res(i).BoundingBox(2,2);
        maxx=max(x1,maxx);
        maxx=max(x2,maxx);
        minx=min(x1,minx);
        minx=min(x2,minx);
        maxy=max(y1,maxy);
        maxy=max(y2,maxy);
        miny=min(y1,miny);
        miny=min(y2,miny);
        mind=min(norm([x1,y1]-[x2,y2]),mind);
    end

    dx=maxx-minx;
    dy=maxy-miny;
    numx=round(dx/res);
    numy=round(dy/res);
    landGrid=zeros(numy+2*buffer,numx+2*buffer);
    for i=1:numseg
        x1=round((shp_res(i).BoundingBox(1,1)-minx)/res);
        x2=round((shp_res(i).BoundingBox(2,1)-minx)/res);
        y1=round((shp_res(i).BoundingBox(1,2)-miny)/res);
        y2=round((shp_res(i).BoundingBox(2,2)-miny)/res);
        d=round(norm([x1,y1]-[x2,y2]));
        if x1==x2
            if y1==y2
                x=x1;
                y=y1;
            else
                x=[x1,x1];
                y=[y1,y2];
            end
        elseif y1==y2
            x=[x1,x2];
            y=[y1,y1];
        else
            x=round(x1:(x2-x1)/d:x2);
            y=round(y1:(y2-y1)/d:y2);
        end
        landGrid(y+1+buffer,x+1+buffer)=1;
    end
end
