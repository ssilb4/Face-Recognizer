clc, clear all, close all
src = imread('nsys_007.bmp');
BW = roipoly(src);
figure(2),imshow(BW);

objectr = double(BW).*double(src(:,:,1));
objectg = double(BW).*double(src(:,:,2));
objectb = double(BW).*double(src(:,:,3));

%rm = mean2(objectr);
%gm = mean2(objectg);
%bm = mean2(objectb);

%rm = 200;
%gm = 150;
%bm = 220;

objectr(objectr==0)=[];
objectg(objectg==0)=[];
objectb(objectb==0)=[];

rm = mean(objectr);
gm = mean(objectg);
bm = mean(objectb);

%rm2 = sum(objectr(:))/sum(BW(:));
%gm2 = mean2(nonzeros(objectg));

DistanceMap = sqrt(double((src(:,:,1)-rm).^2 + (src(:,:,2)-gm).^2 + (src(:,:,3)-bm).^2));
%maxV = max(max(DistanceMap));
%for i = 1:512
%    for j = 1:512
%        if(DistanceMap(i,j) < maxV)
%            DistanceMap(i,j) = 0;
%        end
%    end
%end
figure, imshow(DistanceMap);
imwrite(BW,'nsys_007_mask.bmp');
