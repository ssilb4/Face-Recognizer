function result = color_range(src)
result = src;
r = src(:,:,1);
g = src(:,:,2);
b = src(:,:,3);
src2 = rgb2ycbcr(src);
cb = src2(:,:,2);
cr = src2(:,:,3);
src3 = rgb2hsv(src);
h = src3(:,:,1);

[x,y,c] = size(src);

for i = 1:x
    for j = 1:y
        if(cr(i,j)<=1.5862*cb(i,j)+20)
            if(cr(i,j)>=0.3448*cb(i,j)+76.2069)
                if(cr(i,j)>=-4.5652*cb(i,j)+234.5652)
                    if(cr(i,j)<=-1.15*cb(i,j)+301.75)
                        if(cr(i,j)<=-2.2857*cb(i,j)+432.85)
                            if(h<0.0694 || h>0.6388)
                                if(r(i,j)>95 && g(i,j)>40 && b(i,j)>20)
                                    if((max(max(r(i,j),g(i,j)),b(i,j)) - min(min(r(i,j),g(i,j)),b(i,j)))>15)
                                        if(abs(r(i,j)-g(i,j))>15 && r>g && r>b)
                                            result(i,j,1) = 1;
                                            result(i,j,2) = 1;
                                            result(i,j,3) = 1;
                                        end
                                    end
                                end
                                if(r>220 && g>210 && b>170 && abs(r-g)<=15 && r>b && g<b)
                                    result(i,j,1) = 1;
                                    result(i,j,2) = 1;
                                    result(i,j,3) = 1;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
    
assignin('base','src',src);
    
    