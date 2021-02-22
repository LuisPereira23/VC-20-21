%%
% Loading images
image1 = imread('images/gait_RGB_oneimage.png');
image2 = imread('images/gait_depth_oneimage.png');

%%
% Crop images
range = images.spatialref.Rectangle([240 410],[80 300]);

cropped1 = imcrop(image1,range);
cropped2 = imcrop(image2,range);

%%
% Generating final black and white image
arrayMax = getMax(cropped2);

d = mediaDelta(cropped2);

finalResult = blackWhite(arrayMax, d, cropped2);

imshow(finalResult)