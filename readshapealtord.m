function [landGrid,altGrid]=readshapealtord(shapefile,altfile)
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
    sord=zeros(1,k);
    k=0;
    for i=1:numseg
        numpts=length(shp_res(i).X);
        segord=shp_res(i).StreamOrde;
        for j=1:numpts
            k=k+1;
            xx(k)=shp_res(i).X(j);
            yy(k)=shp_res(i).Y(j);
            sord(k)=segord;
            if j>1 && ~isnan(xx(k))
                d=norm([xx(k) yy(k)]-[xx(k-1) yy(k-1)]);
                if d>res
                    nseg=ceil(d/res)+1;
                    tempx=linspace(xx(k-1),xx(k),nseg);
                    tempy=linspace(yy(k-1),yy(k),nseg);
                    sord(k-1:k+nseg-2)=ones(1,nseg)*segord;
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
            if mod(sord(k),2)==0
                for xio=1:sord(k)
                    for yio=1:sord(k)
                        landGrid(round(yy(k)/res-sord(k)/2+0.5+xio-1)+buffer,round(xx(k)/res-sord(k)/2+0.5+yio-1)+buffer)=1;
                    end
                end
            else
                for xio=1:sord(k)
                    for yio=1:sord(k)
                        landGrid(round(yy(k)/res-(sord(k)-1)/2+xio-1)+buffer,round(xx(k)/res-(sord(k)-1)/2+yio-1)+buffer)=1;
                    end
                end
            end
        end
    end
    if strcmp(altinfo.ColumnsStartFrom,'north')
        altGrid=altGrid(end:-1:1,:);
    end
    if strcmp(altinfo.RowsStartFrom,'east')
        altGrid=altGrid(:,end:-1:1);
    end
end

