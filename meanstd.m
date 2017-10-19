function [am,as] = meanstd(z1,z2,z3,z4,z5,z6,z7,z8,z9,z10)

am  = (z1+z2+z3+z4+z5+z6+z7+z8+z9+z10)/10;
as = sqrt(((z1-am).^2 + (z2-am).^2 + (z3-am).^2 + (z4-am).^2 + (z5-am).^2 + (z6-am).^2 + (z7-am).^2 + (z8-am).^2 + (z9-am).^2 + (z10-am).^2)/10);