function [last,referenceColor]= correlation(i,noFrames,originalGray,n)
for k=i:noFrames-1
    c=corr2(originalGray{k},originalGray{k+1});
    if(c < 0.7)
       
      BetterImage=histeqz(originalGray,i);

if strcmpi(n,'p')
     referenceColor = patternMatch(BetterImage);
else
    
    filename2 = input('File name REFERENCE: ','s');
    filename2=strcat('/Users/lakshman/Documents/MATLAB/HIST/images/',filename2);
    referenceColor=imread(filename2);
    
    
end
    
     disp('Correlation...');
     last=k;
     return;
    end
end
last=noFrames;
BetterImage=histeqz(originalGray,i);

if strcmpi(n,'p')
     referenceColor = patternMatch(BetterImage);
else
    filename2 = input('File name REFERENCE: ','s');
    filename2=strcat('/Users/lakshman/Documents/MATLAB/HIST/images/',filename2);
    referenceColor=imread(filename2);
end

end