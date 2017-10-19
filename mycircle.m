function circle = mycircle(h,w,r)
    circle = zeros(h,w);
    for i = 1:h
        for j = 1:w
            if sqrt((h/2 - i)^2 + (w/2 - j)^2) < r
              circle(i,j) = 255;
            end
        end
    end
end