function [rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train(src, mask, rv,gv,bv,yv,cbv,crv,hv,sv,vv)
    [r11, g11, b11] = rgbm(src,mybinarize(mask));
    [rv, gv, bv] = myvector3(rv,gv,bv,r11,g11,b11);
    src2 = rgb2ycbcr(src);
    [y11, cb11, cr11] = rgbm(src2,mybinarize(mask));
    [yv, cbv, crv] = myvector3(yv,cbv,crv,y11,cb11,cr11);
    src3 = rgb2hsv(src);
    [h11, s11, v11] = rgbm(src3, mybinarize(mask));
    [hv, sv, vv] = myvector3(hv,sv,vv,h11,s11,v11);
end