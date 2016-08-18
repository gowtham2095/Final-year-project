function [reference] = patternMatch(imageG)

dbname = 'colorization';
username = 'root';
password = 'password';
driver = 'com.mysql.jdbc.Driver';
dburl = ['jdbc:mysql://localhost:3306/' dbname];

grayt = imageG;
grayt=imresize(grayt,[512 512]);

H=imhist(grayt);
javaclasspath('/Users/lakshman/Documents/MATLAB/MySQL/mysql-connector-java-5.1.38-bin.jar');

conn = database(dbname, username, password, driver, dburl);

sqlquery = 'select * from images';
results = fetch(conn,sqlquery);
k=size(results);

T(1:256)=0;
 i=1;
 sum=0;

min1=1000000;
while(i<=k(1))
    
        temp=results(i,1);
         s=strcat('/Users/lakshman/Documents/MATLAB/HIST/images/',temp);
         
        ref=imread(s{1});
        ref=rgb2gray(ref);
        ref=imresize(ref,[512 512]);
        R=imhist(ref);
        
        for j=1:256
            
            T(j)=abs(R(j)-H(j));
            sum=sum+T(j);
            
        end
       
        if(sum<min1)
            min1=sum;
            reference=temp;
           
        end
        
        sum=0;
        i=i+1;
       
        
end;
s=strcat('/Users/lakshman/Documents/MATLAB/HIST/images/',reference);
reference = imread(s{1});
figure; imshow(reference); title('DB reference');

close(conn);