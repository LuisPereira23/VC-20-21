


Img = imread('lena.jpg');

gray= rgb2gray(Img);
figure;imshow(gray);

BW= edge(gray,'Sobel');
figure;imshow(BW);
Bl= edge(gray,'log');
figure;imshow(Bl);
prew = edge(gray,'prewitt');
figure;imshow(prew);
can = edge(gray,'canny');
figure;imshow(can);