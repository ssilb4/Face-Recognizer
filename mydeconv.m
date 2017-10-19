function deconv_img = mydeconv(img, PSF, NSR, type)
    if strcmp(type,'Wiener')
        deconv_img = deconvwnr(img, PSF, NSR);
    end
    if strcmp(type,'Lucy')
        deconv_img = deconvlucy(img, PSF);
    end
    if strcmp(type, 'blind')
        [deconv_img, cal_PSF] = deconvblind(img, PSF);
    end
end