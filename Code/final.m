
%% BEGIN

clc;
close all;
clear all;
warning off;


n=input('File name GRAYSCALE: ','s');

[pathstr,name,ext] = fileparts(n);

if strcmpi(ext, '.mp4') || strcmpi(ext,'.avi') == 1 || strcmpi(ext,'.mov') == 1  %should use end

tic;

filename1 = n;
filename1=strcat('/Users/lakshman/Documents/MATLAB/HIST/videos/',filename1);
obj = VideoReader(filename1);
noFrames= obj.NumberOfFrames;

fprintf('Total number of frames in video: %d\n\n',noFrames);
noFrames= input('Enter no of FRAMES: ');
Video=VideoWriter('/Users/lakshman/Documents/MATLAB/HIST/saved/grayINPUT','MPEG-4');

Video.FrameRate = 25; 
Video.Quality = 100;
open(Video);

Frame = 1;
for l=1:noFrames
    img = read(obj,l);
    originalGray{l} = rgb2gray(img); % ORIGINAL GRAY
end
videowrite(1,noFrames,Video,originalGray);
close(Video);

[m,n]=size(originalGray{1});
i=1;

sprintf('\n\n');
n=input('\nSave file name MP4: ','s');
n=strcat('/Users/lakshman/Documents/MATLAB/HIST/saved/',n);
 VideoObj = VideoWriter(n,'MPEG-4');
    VideoObj.FrameRate = 25; 
    VideoObj.Quality = 100;
    open(VideoObj);
    
 n=input('PATTERN MATCHING OR REFERENCE IMAGE(p/r): ','s');

while i<noFrames
    [last , referenceColor]=correlation(i,noFrames,originalGray,n);
    [rgb]=luminance(i,originalGray,last);
    [imgOut]=histmatch(i,referenceColor,rgb,last);
    [VideoObj]=videowrite(i,last,VideoObj,imgOut);
    img1=read(obj,i);
    X = rgb2gray(img1);
    measures(referenceColor,imgOut{1},img1);
    displayz(X,referenceColor,imgOut{1});
    i=last+1; 
end

toc;

       
close(VideoObj);
fprintf('\nVIDEO saved.\n\n');

elseif strcmpi(ext, '.png') || strcmpi(ext,'.jpg') == 1 || strcmpi(ext,'.jpeg') == 1
    
inputP = input('\nPATTERN MATCHING (P) or REFERENCE (R): ','s');
tic;
filename1 = n;
filename1=strcat('/Users/lakshman/Documents/MATLAB/HIST/images/',filename1);
originalGray1 = imread(filename1);
originalGray{1} =rgb2gray(imread(filename1));
imshow(originalGray{1});
[rgb]=luminance(1,originalGray,1);

if strcmpi(inputP, 'p')
BetterImage=histeqz(originalGray,1);
referenceColor = patternMatch(BetterImage);
imshow(referenceColor);
[imgOut]=histmatch(1,referenceColor,rgb,1);
imwrite(imgOut{1},'/Users/lakshman/Documents/¸MATLAB/HIST/saved/output.png');



elseif strcmpi(inputP, 'r')
filename2 = input('File name REFERENCE: ','s');
filename2=strcat('/Users/lakshman/Documents/MATLAB/HIST/images/',filename2);
referenceColor=imread(filename2);
imshow(referenceColor);
[imgOut]=histmatch(1,referenceColor,rgb,1);
imwrite(imgOut{1},'/Users/lakshman/Documents/MATLAB/HIST/saved/output.png');
end

measures(referenceColor,imgOut{1},originalGray1);
displayz(originalGray{1},referenceColor,imgOut{1});

toc;

end
beep;




