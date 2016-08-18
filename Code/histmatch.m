function [imgOut]=histmatch(i,referenceColor,rgb,last)
img2 = referenceColor;

noBins = 256;

for k=1:last-i+1
    imgOut{k} = zeros(size(rgb{1}),class(rgb{1}));
end

for k = 1:3 % RGB IMAGE X Y 3
    hist = imhist(img2(:,:,k),noBins); % CALCULATE HISTOGRAM OF THE SECOND IMAGE
    for ii=1:last-i+1
        imgOut{ii}(:,:,k) = histeq(rgb{ii}(:,:,k),hist); % APPLY HISTOGRAM TO THE FIRST IMAGE
    end
end
end