function [resposta] =addNoise(img,noiseType,var)
if strcmp('salt & pepper',noiseType)
    resposta= imnoise(img,'salt & pepper',var{1});
end
if strcmp('gaussian',noiseType)
    resposta= imnoise(img,'gaussian',var{1},var{2});   
end

end

