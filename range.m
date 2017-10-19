function result = range(src,m1,m2,m3,s1,s2,s3)
% s1=s1*2;
% s2=s2*2;
% s3=s3*2;
[h,w,c] = size(src);
result = src;
for i = 1:h
    for j = 1:w
%          if(src(i,j,1)>(m1-s1) && src(i,j,1)<(m1+s1))
%                 result(i,j,1) = 1;
%                 result(i,j,2) = 1;
%                 result(i,j,3) = 1;
%             else
%                 result(i,j,1) = 0;
%                 result(i,j,2) = 0;
%                 result(i,j,3) = 0;
%          end
%         if(src(i,j,2)>(m2-s2) && src(i,j,2)<(m2+s2))
%                 result(i,j,1) = 1;
%                 result(i,j,2) = 1;
%                 result(i,j,3) = 1;
%         else
%                 result(i,j,1) = 0;
%                 result(i,j,2) = 0;
%                 result(i,j,3) = 0;
%         end
%         if(src(i,j,3)>(m3-s3) && src(i,j,3)<(m3+s3))
%                 result(i,j,1) = 1;
%                 result(i,j,2) = 1;
%                 result(i,j,3) = 1;
%         else
%                 result(i,j,1) = 0;
%                 result(i,j,2) = 0;
%                 result(i,j,3) = 0;
%         end
%  & src(i,j,3)>(m3-s3) & src(i,j,3)<(m3+s3)
        if((src(i,j,1)>(m1-s1) && src(i,j,1)<(m1+s1)) || (src(i,j,2)>(m2-s2) && src(i,j,2)<(m2+s2)))
            result(i,j,1) = 1;
            result(i,j,2) = 1;
            result(i,j,3) = 1;
        else
            result(i,j,1) = 0;
            result(i,j,2) = 0;
            result(i,j,3) = 0;
        end

%          if(src(i,j,1)>(m1-s1) && src(i,j,1)<(m1+s1))
%             if(src(i,j,2)>(m2-s2) && src(i,j,2)<(m2+s2))
%                 if(src(i,j,3)>(m3-s3) && src(i,j,3)<(m3+s3))
%                     result(i,j,1) = 1;
%                     result(i,j,2) = 1;
%                     result(i,j,3) = 1;
%                 else
%                     result(i,j,1) = 0;
%                     result(i,j,2) = 0;
%                     result(i,j,3) = 0;
%                 end
%             end
%         end
    end
end
        