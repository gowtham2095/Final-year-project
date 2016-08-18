function []=displayz(originalGray,referenceColor,grayColor)
figure('units','normalized','outerposition',[0 0 1 1]); 
figure;
subplot(1,3,1); imshow(originalGray); title('Grayscale Image');
subplot(1,3,2); imshow(referenceColor); title('Reference Image');
subplot(1,3,3); imshow(grayColor); title('Colored Image');

%% HISTOGRAMS

figure('position', [350, 0, 750, 750]); % LEFT BOTTOM WIDTH HEIGHT
subplot(3,1,1); imhist(originalGray); axis([0 255 0 4000]); title('GRAYSCALE IMAGE HISTOGRAM');


noBins = 256;

rHist = imhist(referenceColor(:,:,1), noBins);
gHist = imhist(referenceColor(:,:,2), noBins);
bHist = imhist(referenceColor(:,:,3), noBins);

subplot(3,1,2);
axis([0 255 0 4000]);
hold on
Z(1) = stem(0:255, rHist); Z(1).Color = 'red';
Z(2) = stem(0:255, gHist); Z(2).Color = 'green';
Z(3) = stem(0:255, bHist); Z(3).Color = 'blue';
hold off
title('REFERENCE IMAGE HISTOGRAM');

rHist = imhist(grayColor(:,:,1), noBins);
gHist = imhist(grayColor(:,:,2), noBins);
bHist = imhist(grayColor(:,:,3), noBins);

subplot(3,1,3);
axis([0 255 0 4000]);
hold on
Z(1) = stem(0:255, rHist); Z(1).Color = 'red';
Z(2) = stem(0:255, gHist); Z(2).Color = 'green';
Z(3) = stem(0:255, bHist); Z(3).Color = 'blue';
hold off
title('COLORED IMAGE HISTOGRAM');
end