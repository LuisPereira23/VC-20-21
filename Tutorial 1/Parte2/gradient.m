function [Gx,Gy] = gradient(img)

[sx,sy]= size(img);

Zh = [-1 -2 -1;
       0 0 0;
       1 2 1];
   
Zv = [ -1  0  1;
       -2  0  2;
       -1  0  1];
   
   Gx = zeros(sx,sy);
   Gy = zeros(sx,sy);
   for i = 2:(sx-1)
       for j = 2:(sy-1)
           pixeis = double(img(i-1:i+1,j-1:j+1));
           x=sum(sum(Zh.*pixeis));
           y=sum(sum(Zv.*pixeis));
           Gx(i,j) = uint8(sqrt(x.^2+y.^2));
           
           Gy(i,j) = rad2deg(atan2(y,x));
           
       end
   end
   
   
   
  Gx = uint8(Gx);
end