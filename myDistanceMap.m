function Distance = myDistanceMap(src, a,b,c)
Distance = sqrt((double(a)-double(src(:,:,1))).^2+(double(b)-double(src(:,:,2))).^2+(double(c)-double(src(:,:,3))).^2);

