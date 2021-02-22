function [result] = blackWhite(maxArr, d, depthArr)
%FUNCTION Generate black and white image
result = [];
n = 221;
m = 171;

for i = n:-1:2
    for j = m:-1:2
        if depthArr(n,j) - (n-i) * d > depthArr(i,j) ...
           && depthArr(n,j) - (n-i) * d < depthArr(i,j) + 150 ...
           && depthArr(i,j) < maxArr(i) - 50 ...
           && maxArr(i) - depthArr(i,j) < 250
            result(i,j)= 0;
        else
            result(i,j) = 255;
        end
    end     
end