function [result1, result2] = accuracy(ori_mask, res_mask)
[h,w] = size(ori_mask);
image_size = h*w;

[true1,a] = size(find(bitxor(ori_mask,res_mask) == 0));
result1 = true1/image_size*100;

[ground_size,a] = size(find(ori_mask == 1));

[true2,a] = size(find(bitand(ori_mask,res_mask) ==1));
result2 = true2/ground_size*100;

assignin('base','true2',true1);