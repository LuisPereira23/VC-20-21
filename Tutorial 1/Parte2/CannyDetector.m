

Img = imread('lena.jpg');
%figure; imshow(Img);
%convert to gray first
gray= rgb2gray(Img);
%figure;imshow(Img);
%choose
prompt = 'Select the filterSize\n';
filterSize = input(prompt);
%filterSize = 5; 
prompt2 = 'Select the Variance\n';
variance = input(prompt2);
%variance = 2 ;

%add noise to the image
getnoise=  imnoise(gray,'gaussian',0,0.12);
prompt = 'Select the LT\n';
lh = input(prompt);
prompt = 'Select the UT\n';
lt = input(prompt);
%lh =0.3*255
%lt = 0.6*255

%algorithm
[img1,img2,img3]=main_CannyDetector(getnoise,filterSize,variance,lh,lt);

%comparison
BW= edge(gray,'Sobel');
imwrite(BW,strcat('lena_edge_sobel','.png'));
Bl= edge(gray,'log');
imwrite(Bl,strcat('lena_edge_log','.png'));
prew = edge(gray,'prewitt');
imwrite(prew,strcat('lena_edge_prewitt','.png'));
can= edge(gray,'canny');
imwritecan,strcat('lena_edge_canny','.png');


%results
imwrite(img1,strcat('lena_edge_canny_',num2str(filterSize),'_',num2str(variance),'.png'));
imwrite(img2,strcat('lena_edge_canny_nonmax_',num2str(filterSize),'_',num2str(variance),'.png'));
imwrite(img3,strcat('lena_edge_canny_hysteresis_',num2str(filterSize),'_',num2str(variance),'.png'));