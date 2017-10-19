function result = colordetect(src)
[h,w,c] = size(src);
temp1 = src;

%ruleA
for i = 1:h
    for j = 1:w
        R = src(i,j,1);
        G = src(i,j,2);
        B = src(i,j,3);
        if((R>95 && G>40 && B>20 && ((max(max(R,G),B) - min(min(R,G),B)) > 15) && ((R-G) > 15 || (G-R) > 15) && R>G && R>B) || (R>220 && G>210 && B>170 && ((R-G)<=15||(G-R)<=15) && R>B && G>B))
            temp1(i,j,1)=1;
            temp1(i,j,2)=1;
            temp1(i,j,3)=1;
        else
            temp1(i,j,1)=0;
            temp1(i,j,2)=0;
            temp1(i,j,3)=0;
        end
    end
end
 
%ruleB
temp2 = rgb2ycbcr(src);
for i = 1:h
    for j = 1:w
        cb = temp2(i,j,2);
        cr = temp2(i,j,3);
        if(cr<=1.5862*cb+20 && cr>=0.3448*cb+76.2069 && cr>=-4.5652*cb+234.5652 && cr<=-1.15*cb+301.75 && cr<=-2.2857*cb+452.85)
            temp2(i,j,1)=1;
            temp2(i,j,2)=1;
            temp2(i,j,3)=1;
        else
            temp2(i,j,1)=0;
            temp2(i,j,2)=0;
            temp2(i,j,3)=0;
        end
    end
end
%ruleC
temp3 = rgb2hsv(src);
for i = 1:h
    for j = 1:w
        h = src(i,j,1);
        if(h<25 || h>230)
            temp3(i,j,1) = 1;
            temp3(i,j,2) = 1;
            temp3(i,j,3) = 1;
        else
            temp3(i,j,1) = 0;
            temp3(i,j,2) = 0;
            temp3(i,j,3) = 0;
        end
    end
end

result = double(src);
for i = 1:h
    for j = 1:w
        if(temp1(i,j,1) == 1 && temp2(i,j,1) == 1 && temp3(i,j,1) == 1)
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
% temp4 = bitand(double(temp1),double(temp2));
% result = bitand(temp4,temp3);

figure(6),imshow(temp1*255);
figure(7),imshow(temp1*255);
figure(8),imshow(temp1*255);
assignin('base','irgbi',temp1);
assignin('base','iycbi',temp2);
assignin('base','ihsvi',temp3);
% assignin('base','itmpi',temp4);
assignin('base','iresi',result);