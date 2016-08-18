function[VideoObj] = videowrite(i,last,VideoObj,imgOut)

disp('Writing...');
        for k=1:last-i+1
            writeVideo(VideoObj,imgOut{k});
        end
end