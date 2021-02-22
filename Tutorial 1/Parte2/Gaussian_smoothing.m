function [resposta] = Gaussian_smoothing(img,kernel_size,sigma)
resposta= imgaussfilt(img,sigma,'FilterSize',kernel_size,'FilterDomain','spatial');
end

