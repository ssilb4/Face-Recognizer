function [result,DistanceMap] = finish(DistanceMap, Oval, result)

[h, w] = size(DistanceMap);
 for i = 1:h
     for j = 1:w
         DistanceMap(i, j) = DistanceMap(i, j)*Oval(i, j); 
     end
 end
DistanceMap = bwmorph(DistanceMap, 'erode', 1);
DistanceMap = bwmorph(DistanceMap, 'hbreak', 20000);

L = bwlabel(DistanceMap, 4);
for k=1:max(max(L))
    [m,n] = find(L==k);
    x = [min(n), max(n), max(n),min(n), min(n)];
    y = [min(m), min(m) ,max(m),max(m), min(m)];
 
    hold on;
  if (max(m)-min(m))/(max(n) - min(n)) >1.8 || (max(m)-min(m))/(max(n) - min(n)) <0.5
        for i = 1:h
            for j = 1:w
               if L(i, j) == k
                    DistanceMap(i, j) = 0;
                end
            end
        end
          plot(x, y, 'r', 1, 1);
  end
end
DistanceMap = bwmorph(DistanceMap, 'dilate', 3);
DistanceMap = bwmorph(DistanceMap, 'fill', 2000000000000);

for i = 1:h
    for j = 1:w
       if DistanceMap(i,j)==0
           result(i,j,:)=0;
       end
    end
end

