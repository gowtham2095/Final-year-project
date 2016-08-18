PREREQUISITES :

1. MATLAB

2. MYSQL

3. JDBC Connector


INSTALLATION : 

MATLAB

1. Download the installer from the MathWorks website (http://in.mathworks.com/academia/student_version/) or locate your MATLAB DVD.

2. Start the installer. The method you use to start the installer depends on your platform and whether you download the installer from the MathWorks website or use a DVD.

3. The name of the self-extracting installer file is matlab_release_$ARCH, where release is the release you are installing (for example R2016a) and $ARCH is the selected architecture.



MYSQL

1. Download the MySQL Installer and run the installation file.

2. The MySQL Installer handles the initial configuration and set up of the applications.

3. By default, a Windows service for the MySQL server is added.

4. Start the MySQL server.


JDBC Connector

1. First copy/paste the driver (jar file: mysql-connector-java-5.1.18-bin.jar in the required MATLAB folder. Now, go in MATLAB workspace and add this code:

2. Type the command 'prefdir' in the MATLAB Command Window and copy the output location.
 
3. Go to the location and create a file 'javaclasspath.txt' and provide the location of the MySQL connector (JAR File) e.g '/java/jarext/mysql-connector-java-5.1.15-bin.jar'. 

4. Also, add the Java classpath in the SQL connection program.
