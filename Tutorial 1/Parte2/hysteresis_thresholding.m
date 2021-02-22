function [Img] = hysteresis_thresholding(forte,fraca)



[sx,sy]=size(forte);
Img = false(sx,sy);
for i = 2 : sx - 1
    for j = 2 : sy - 1
        if(forte(i,j))
            Img(i,j) =1;
        end
        if(forte(i,j) && any(any(fraca(i-1:i+1,j-1:j+1))))
            Img = blob(Img,fraca,i,j);
        end
    end
end


end
