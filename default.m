function [hm,cbm,crm,hs,cbs,crs,cbv,crv,hv] = default(rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('�ϱ���_008.bmp');
mask = imread('�ϱ���_008_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('�ϱ���_001.bmp');
mask = imread('�ϱ���_001_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('���̻�_009.bmp');
mask = imread('���̻�_009_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('���̻�_008.bmp');
mask = imread('���̻�_008_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('����_009.jpg');
mask = imread('����_009_mask.jpg');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('����_007.jpg');
mask = imread('����_007_mask.jpg');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('nsys_007.bmp');
mask = imread('nsys_007_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('return0_007.jpg');
mask = imread('return0_007_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('return0_003.jpg');
mask = imread('return0_003_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('nsys_008.bmp');
mask = imread('nsys_008_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('nsys_003.jpg');
mask = imread('nsys_003_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('N-ICE_008.bmp');
mask = imread('N-ICE_008_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('N-ICE_005.bmp');
mask = imread('N-ICE_005_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('EYES_008.bmp');
mask = imread('EYES_008_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('EYES_006.bmp');
mask = imread('EYES_006_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

% src = imread('12131761_2_.jpg');
% mask = imread('12131761_mask2.bmp');
% [rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('12124089.jpg');
mask = imread('12124089_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('12111596.jpg');
mask = imread('12111596_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('nsys_008.bmp');
mask = imread('nsys_008_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('12111502.jpg');
mask = imread('12111502_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('12111481.jpeg');
mask = imread('12111481_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('12101546.jpg');
mask = imread('12101546_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('12101505(2).bmp');
mask = imread('12101505(2)_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('12091722.png');
mask = imread('12091722_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('12091429.jpg');
mask = imread('12091429_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('234_010.bmp');
mask = imread('234_010_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

src = imread('234_006.bmp');
mask = imread('234_006_mask.bmp');
[rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv);

cbm = mean(cbv);
cbs = std(cbv);
crm = mean(crv);
crs = std(crv);
hm = mean(hv);
hs = std(hv);