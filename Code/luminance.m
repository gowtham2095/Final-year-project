function [rgb]=luminance(i,originalGray,last)
l=i;
for k=1:last-i+1
Y1{k} = rgb2ycbcr(originalGray{l}(:,:,[1 1 1]));
l=l+1;
end 

M1 = double(Y1{1}(:,:,1));
[rows,cols] = size(M1);
X(1:rows,1:cols) = 128;

for k=1:last-i+1
    output{k} = cat(3, Y1{k}(:,:, 1), X, X);
    rgb{k} = uint8(ycbcr2rgb(output{k}));
end

end