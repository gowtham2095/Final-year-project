function [BetterImage]=histeqz(originalGray,i)
beforeHist = originalGray{i};

threshold = 230;

[N,edges] = histcounts(originalGray{i});
diffOld = max(edges) - min(edges);
BetterImage=originalGray{i};

if diffOld < threshold        
BetterImage = histEqualization(originalGray{i}); 

subplot(2,2,1); imshow(beforeHist); title('Before Histogram Equalization');
subplot(2,2,2); axis([0 255 0 4000]); imhist(beforeHist); 
subplot(2,2,3); imshow(BetterImage); title('After Histogram Equalization');
subplot(2,2,4); axis([0 255 0 4000]); imhist(BetterImage);

 

end

end
