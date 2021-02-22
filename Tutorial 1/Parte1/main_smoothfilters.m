function [imageWithNoise,filteredImage] = main_smoothfilters(image,noise,density,mean,variance,domain,filter,width,deviation,order,cut)
% Algoritmos

%   Adding noise
if noise == "salt & pepper"
    imageWithNoise = imnoise(image,'salt & pepper',density);
else 
    imageWithNoise = imnoise(image,'gaussian',mean,variance);
end

% Spatial Filters
if domain == "spatial" && filter == "average"
    kernel = fspecial('average',width);
    filteredImage= imfilter(imageWithNoise,kernel,'replicate');
end

if domain == "spatial" && filter == "gaussian"
    kernel = fspecial('gaussian',width,deviation);
    filteredImage = imfilter(imageWithNoise,kernel,'corr','replicate');
end

if domain == "spatial" && filter == "median"
    filteredImage = medfilt2(imageWithNoise,[width,width],'symmetric');
end

% DFT 
% finding magnitude spectrum

%dftOriginal =fftshift(fft2(image));
%dftNoisy =fftshift(fft2(imageWithNoise));
%dftFiltered =fftshift(fft2(filteredImage));

%s1=log(1+abs(abs(dftOriginal)));
%s2=log(1+abs(abs(dftNoisy)));
%s3=log(1+abs(abs(dftFiltered)));

%f1 = ifft2(ifftshift(dftOriginal));

%imshow(s1,[]);
%imshow(s2,[]);
%imshow(s3,[]);


% Frequency Filters
if domain == "frequency" && filter == "gaussian"
  PQ = paddedsize(size(imageWithNoise));
  h = fspecial('gaussian',PQ,deviation);
 H= freqz2(h, PQ(1),PQ(2));
 H1=ifftshift(H);
 Gs=imfilter(double(imageWithNoise),h);
 Gf= dftfilt(imageWithNoise,H1);
    filteredImage = Gf;
end
if domain == "frequency" && filter == "butterworth"
    PQ = size(imageWithNoise);
    FT_img = fft2(double(image));  
    %eucledian distance
    u = 0:(PQ(1)-1); 
    v = 0:(PQ(2)-1); 
    idx = find(u > PQ(1)/2); 
    u(idx) = u(idx) - PQ(1); 
    idy = find(v > PQ(2)/2); 
    v(idy) = v(idy) - PQ(2);
    [V, U] = meshgrid(v, u); 
    D = sqrt(U.^2 + V.^2);
    %filter mask
    H = 1./(1 + (D./cut).^(2*order));
    %convolution
    G = H.*FT_img;
    %inverse fourier
    filteredImage = real(ifft2(double(G))); 
end

end

