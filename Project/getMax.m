function [result] = getMax(arr)
result = [];
max = 0;

for i = 1 : 221
    for j = 1 : 171
        if arr(i,j) >= max
         max = arr(i,j);
        end
    end
    result(end + 1) = max;
    max = 0;
end
