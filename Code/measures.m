function [] = measures(referenceColor, grayColor, grayOriginal)

 

%% IMAGES

referenceColor = im2uint8(referenceColor);

referenceColor = imresize(referenceColor,[512 512]);

referenceColor1 = rgb2hsv(referenceColor);

r1 = referenceColor(:,:,1);

g1 = referenceColor(:,:,2);

b1 = referenceColor(:,:,3);

 


grayColor = im2uint8(grayColor);

grayColor = imresize(grayColor,[512 512]);

grayColor1 = rgb2hsv(grayColor);

r2 = grayColor(:,:,1);

g2 = grayColor(:,:,2);

b2 = grayColor(:,:,3);

 


grayOriginal = im2uint8(grayOriginal);

grayOriginal = imresize(grayOriginal,[512 512]);

grayOriginal1 = rgb2hsv(grayOriginal);

r3 = grayOriginal(:,:,1);

g3 = grayOriginal(:,:,2);

b3 = grayOriginal(:,:,3);

 

%% ENTROPY

fprintf('\n---------> MEASURES\n');

fprintf('\n---> ENTROPY');

fprintf('\n\nGrayscale Colored:');

rEntropy = entropy(r2); fprintf('\n RED Channel: %0.3f',rEntropy);

gEntropy = entropy(g2); fprintf('\n GREEN Channel: %0.3f',gEntropy);

bEntropy = entropy(b2); fprintf('\n BLUE Channel: %0.3f',bEntropy);

 

fprintf('\n\nGrayscale in Original Color:');

rEntropy = entropy(r3); fprintf('\n RED Channel: %0.3f',rEntropy);

gEntropy = entropy(g3); fprintf('\n GREEN Channel: %0.3f',gEntropy);

bEntropy = entropy(b3); fprintf('\n BLUE Channel: %0.3f',bEntropy);

 

%% MEAN INTENSITY

fprintf('\n\n---> MEAN INTENSITY');

fprintf('\n\nGrayscale Colored:');

rIntensity = mean(mean(r2)); fprintf('\n RED Channel: %0.3f',rIntensity);

gIntensity = mean(mean(g2)); fprintf('\n GREEN Channel: %0.3f',gIntensity);

bIntensity = mean(mean(b2)); fprintf('\n BLUE Channel: %0.3f',bIntensity);

intensity = mean2(grayColor); fprintf('\n Image: %0.3f',intensity);

 

fprintf('\n\nGrayscale in Original Color:');

rIntensity = mean(mean(r3)); fprintf('\n RED Channel: %0.3f',rIntensity);

gIntensity = mean(mean(g3)); fprintf('\n GREEN Channel: %0.3f',gIntensity);

bIntensity = mean(mean(b3)); fprintf('\n BLUE Channel: %0.3f',bIntensity);

intensity = mean2(grayOriginal); fprintf('\n Image: %0.3f',intensity);

 

%% HUE SATURATION AND LIGHTNESS

 

fprintf('\n\n---> HUE, SATURATION AND BRIGHTNESS');

fprintf('\n\nGrayscale Colored:');

h = mean(mean(grayColor1(:,:,1))); fprintf('\n HUE Channel: %0.3f',h);

s = mean(mean(grayColor1(:,:,2))); fprintf('\n SATURATION Channel: %0.3f',s);

v = mean(mean(grayColor1(:,:,3))); fprintf('\n BRIGHTNESS Channel: %0.3f',v);

 

fprintf('\n\nGrayscale in Original Color:');

h = mean(mean(grayOriginal1(:,:,1))); fprintf('\n HUE Channel: %0.3f',h);

s = mean(mean(grayOriginal1(:,:,2))); fprintf('\n SATURATION Channel: %0.3f',s);

v = mean(mean(grayOriginal1(:,:,3))); fprintf('\n BRIGHTNESS Channel: %0.3f\n',v);

 

%% PSNR

 

fprintf('\n\n---> PEAK SIGNAL-TO-NOISE RATIO (PSNR)');


fprintf('\nBetween COLORED GRAYSCALE and ORIGINAL COLOR');

[peaksnr, snr] = psnr(grayColor, grayOriginal);

fprintf('\n The Peak-SNR value is %0.3f', peaksnr);

fprintf('\n The SNR value is %0.3f \n', snr);
