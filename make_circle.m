function result = make_circle(src,bbox)
result = src;
x1 = (bbox(2)+bbox(4)+bbox(2))/2 + bbox(4)*0.3;
x2 = (bbox(2)+bbox(4)+bbox(2))/2 - bbox(4)*0.3;
y = (bbox(1)+bbox(3)+bbox(1))/2;


[h,w,c] = size(src);

for i = 1:h
    for j = 1:w
        if( sqrt((i-x1)^2 + (j-y)^2) + sqrt((i-x2)^2 + (j-y)^2) <= bbox(4) )
            result(i,j,1) = 1;
            result(i,j,2) = 1;
            result(i,j,3) = 1;
        else
            result(i,j,1) = 0;
            result(i,j,2) = 0;
            result(i,j,3) = 0;
        end
    end
end