function [img1,img2,img3] =main_CannyDetector(img,kernel_size,sigma,lt,ht)

img=Gaussian_smoothing(img,kernel_size,sigma);
%figure;imshow(img)


[img1,Eo] = gradient(img);

%figure;imshow(img1);
%figure;imshow(Eo);

img2=nonmax(img1,Eo);
%figure;imshow(img2);
[forte,fraca]=double_threshold(img2,lt,ht);
%figure;imshow(forte);figure;imshow(fraca);
img3=hysteresis_thresholding(forte,fraca);

%figure;imshow(img3);



end