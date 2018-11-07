function [landGrid,altGrid]=readshapealt(shapefile,altfile)
    buffer=1;
% produce landGrid and altGrid from shapefile and altitude tiff file
    [altGrid,altinfo]=geotiffread(altfile);
    X=altinfo.XWorldLimits;
    Y=altinfo.YWorldLimits;
    sizex=size(altGrid,2);
    sizey=size(altGrid,1);
    resx=abs(X(1)-X(2))/sizex;
    resy=abs(Y(1)-Y(2))/sizey;
    if resx==resy
        res=resx;
    else
        disp('X and Y resolution of altitude file are different')
        disp(num2str(resx))
        disp(num2str(resy))
    end
    
    shp_res = shaperead(shapefile);
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
    if maxx<=max(X)
        maxx=max(X);
    else
        disp('Altitude region needs to fully contain river region')
    end
    
    minx=min(xx);
    if minx>=min(X)
        minx=min(X);
    else
        disp('Altitude region needs to fully contain river region')
    end
    
    maxy=max(yy);
    if maxy<=max(Y)
        maxy=max(Y);
    else
        disp('Altitude region needs to fully contain river region')
    end
    
    miny=min(yy);
    if miny>=min(Y)
        miny=min(Y);
    else
        disp('Altitude region needs to fully contain river region')
    end

    landGrid=zeros(sizey,sizex);
    xx=xx-minx;
    yy=yy-miny;

    for k=1:length(xx)
        if ~isnan(xx(k))
            landGrid(round(yy(k)/res)+buffer,round(xx(k)/res)+buffer)=1;
        end
    end
    if strcmp(altinfo.ColumnsStartFrom,'north')
        altGrid=altGrid(end:-1:1,:);
    end
    if strcmp(altinfo.RowsStartFrom,'east')
        altGrid=altGrid(:,end:-1:1);
    end
end

