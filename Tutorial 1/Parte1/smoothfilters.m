% Smoothfilters 

% Execution command window : filename='filename';smoothfilters
% Where filename is the name of a grey-scale image

image = im2double (imread(filename));

if size(image,3) ~= 1
    image = rgb2gray(image);
end

%% Noise
mean = 0;
variance= 0;
density = 0;

promptNoise = 'Salt-an-pepper or Gaussian noise?  ';
noise = lower(input(promptNoise,'s'));
if  noise == "salt-an-pepper" || noise == "salt" || noise == "pepper" || noise == "salt and pepper"
    noise = 'salt & pepper';
    promptParameter ='Noise density? (Default = 0.05)  ';
    density = input(promptParameter);
    if isempty(density)
       density = 0.05;
    end
else
    noise = 'gaussian';
    promptParameter ='Noise mean? (default = 0)  ';
    mean = input(promptParameter);
    if isempty(mean)
        mean = 0;
    end
    
    promptParameter ='Noise variance? (default =0.01)  ';
    variance = input(promptParameter);
    if isempty(variance)
        variance = 0.01;
    end
    
end

%% Domain and Filter
width = 0;
deviation = 0;
order =0;
cut=0;

promptDomain = ' Spatial or frequency domain?  ';
domain = lower(input(promptDomain,'s'));
if domain == "spatial"
   promptFilter = 'Average, Gaussian or Median filter?   ';
   filter = lower(input(promptFilter,'s'));
   promptWidth = 'Width of the filter? (default = 3)   ';
   width = input(promptWidth);
   if isempty(width)
       width =3;
   end
   
   if filter == "gaussian"
       promptDeviation = 'What is the standart deviation? (default = 0.5)   ';
       deviation = input(promptDeviation);
       if isempty(deviation)
           deviation = 0.5;
       end
   end
else 
    promptFilter  = 'Gaussian or Butterworth filter?   ';
    filter = lower(input(promptFilter,'s'));
   if filter == "gaussian"
       promptDeviation = 'What is the standart deviation? (default = 0.5)   ';
       deviation = input(promptDeviation);
       if isempty(deviation)
           deviation = 0.5;
       end       
   else
       promptOrder = 'What is the filter order?  ';
       order = input(promptOrder);
       promptCut = 'What is the cut-off frequency? (default=10)  ';
       cut = input(promptCut);
       if isempty(cut)
           cut=10;
       end
   end
    
end

%%  function
tStart=cputime; %Timer
[noisyImage,filteredImage] = main_smoothfilters(image,noise,density,mean,variance,domain,filter,width,deviation,order,cut);
tEnd=cputime - tStart;
%% Save
extractName= extractBefore(filename,'.');
if noise == "salt & pepper"
    saveName = sprintf("%s_%s_density=%f",extractName,noise,density);
else 
    saveName = sprintf("%s_%s_mean=%f_variance=%f",extractName,noise,mean,variance);
end
imwrite(noisyImage, saveName,'png');


if domain == "spatial"
    if filter =="average" || filter == "median"
    saveName = sprintf("%s_smooth_%s_width=%f",extractName,filter,width);
    end
    if filter =="gaussian"
        saveName = sprintf("%s_smooth_%s_spatial_width=%f_deviation=%f",extractName,filter,width,deviation);
    end
end

if domain =="frequency"
    if filter == "gaussian"
        saveName = sprintf("%s_smooth_%s_frequency_deviation=%f",extractName,filter,deviation);
    end
     if filter == "butterworth"
        saveName = sprintf("%s_smooth_%s_order=%f_cut-off=%f",extractName,filter,order,cut);
    end
end
imwrite(filteredImage, saveName,'png');