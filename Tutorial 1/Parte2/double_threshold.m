function [forte, fraca] = double_threshold(Em,lt,ht)

[sx,sy]=size(Em);
forte = false(sx,sy);
fraca = false(sx,sy);
for i = 1 : sx 
    for j = 1 : sy
        if(Em(i,j) >= ht)
            forte(i,j) = 1;
        elseif(Em(i,j) >= lt)
            fraca(i,j) = 1;
        end
    end
end



end
