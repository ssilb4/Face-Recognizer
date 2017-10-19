function [rm, gm, bm] = rgbm(src, bw)

objectr = double(bw).*double(src(:,:,1));
objectg = double(bw).*double(src(:,:,2));
objectb = double(bw).*double(src(:,:,3));
objectr(objectr == 0) = [];
objectg(objectg == 0) = [];
objectb(objectb == 0) = [];
%rm = sum(objectr(:))/sum(bw(:));
rm = mean2(nonzeros(objectr));
gm = mean2(nonzeros(objectg));
bm = mean2(nonzeros(objectb));%0이 아닌 값들 중 mean
end