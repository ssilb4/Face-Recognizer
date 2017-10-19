function [result_image,face_image] = test_images(src)

rotate_count = 0;

faceDetector = vision.CascadeObjectDetector;
shapeInserter = vision.ShapeInserter('BorderColor','Custom','CustomBorderColor',[0 255 255]);

I_ori = imread(fullfile(src));
I = I_ori;
I_temp = I_ori;
bbox = step(faceDetector, I_ori);
[h,w] = size(bbox);
for i = -2:3
    if(h~=0)
        I = I_temp;
        break;
    else
        I_temp = imrotate(I_ori, 10*i, 'crop');
        bbox = step(faceDetector, I_temp);
        rotate_count = i;
        [h,w] = size(bbox);
    end
end
    
% I(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3),1) = 0;
% I(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3),2) = 0;
% I(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3),3) = 0;
% figure(20),imshow(I);

I_ycbcr = rgb2ycbcr(I);
I_hsv = rgb2hsv(I);

%imshow(I);shg;
bbox = step(faceDetector, I);
% Draw boxes around detected faces and display results

[h,w] = size(bbox);
if(h == 1)
elseif(h>1)
        max = 0;
        for i = 1:h
            if(size(bbox(4*i))>max)
                max = h;
            end
        end
        bbox = bbox(h,:);
elseif(h==0)
end

% bbox(1) = bbox(1)+bbox(3)*0.2;
% bbox(2) = bbox(2)+bbox(4)*0.2;
% bbox(3) = bbox(3)*0.6;
% bbox(4) = bbox(4)*0.6;
    
y = I_ycbcr(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3),1);
cb = I_ycbcr(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3),2);
cr = I_ycbcr(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3),3);
h = I_hsv(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3),1);
s = I_hsv(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3),2);
v = I_hsv(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3),3);

box_image = I(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3),:);

%ycbcr_mode = mode(I_ycbcr);

ym = mean2(y);
cbm = mean2(cb);
crm = mean2(cr);
hm = mean2(h);
sm = mean2(s);
vm = mean2(v);

ym3 = median(y(:));
cbm3 = median(cb(:));
crm3 = median(cr(:));
hm3 = median(h(:));
sm3 = median(s(:));
vm3 = median(v(:));

ym2 = mode(y(:));
cbm2 = mode(cb(:));
crm2 = mode(cr(:));
hm2 = mode(h(:));
sm2 = mode(s(:));
vm2 = mode(v(:));

ys = std2(double(y));
cbs = std2(double(cb));
crs = std2(double(cr));
hs = std2(double(h));
ss = std2(double(s));
vs = std2(double(v));

temp1 = range(I,cbm,crm,ym,cbm2*0.2,crm2*0.2,ym2*0.1);
temp2 = range(I,hm,sm,vm,hm2*0.2,sm2*0.2,vm2*0.1);

temp4 = make_circle(I,bbox);

if(rotate_count ~= 0 )
    I = imrotate(I, -10*rotate_count,'crop');
end

temp3 = temp1.*temp2;
face_image = I_ori;
result_image = temp4*255;
assignin('base','result_image',result_image);
assignin('base','face_image',face_image);
assignin('base','src',src);
face_image(:,:,1) = double(temp4(:,:,1)).*double(I_ori(:,:,1));
face_image(:,:,2) = double(temp4(:,:,2)).*double(I_ori(:,:,2));
face_image(:,:,3) = double(temp4(:,:,3)).*double(I_ori(:,:,3));
