function [Img] = nonmax(Es,Eo)


[sx,sy] = size(Es);
Img = zeros(sx,sy);

   for i = 2:(sx-1)
       for j = 2:(sy-1)
           o = Eo(i,j);
           if((o>-22.5 && o<=22.5) || o >157.5 || o <=-157.5 )
               if(Es(i,j) < Es(i,j-1) || Es(i,j) < Es(i,j+1))
                   Img(i,j) = 0;
               else
                   Img(i,j) = Es(i,j);
               end
           elseif((o>22.5 && o<=67.5) || (o >-157.5 && o <=-112.5) )

               if(Es(i,j) < Es(i+1,j-1) || Es(i,j) < Es(i-1,j+1))
                   Img(i,j) = 0;
               else
                   Img(i,j) = Es(i,j);
               end
           elseif((o>67.5 && o<=112.5) || (o >-112.5 && o <=-67.5) )
                       
               if(Es(i,j) < Es(i+1,j) || Es(i,j) < Es(i-1,j))
                   Img(i,j) = 0;
               else
                   Img(i,j) = Es(i,j);
               end

           elseif((o>112.5 && o<=157.5) || (o >-67.5 && o <=-22.5) )

               if(Es(i,j) < Es(i-1,j-1) || Es(i,j) < Es(i+1,j+1))
                   Img(i,j) = 0;
               else
                   Img(i,j) = Es(i,j);
               end
           end
           
       end
   end
Img = uint8(Img);
   
   
end
