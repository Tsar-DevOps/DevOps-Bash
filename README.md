# DevOps-Bash

Homework tasks:

1.	Make a memory utilization check script on Linux host, and if it’s lower than 1GB throw an error “Minimum of 1GB RAM is required.” and throw and error.
Verify exit code with help of: 
echo $?
 
2.	Create a backup script of working directory of neither Jenkins xml files (for instance, /app/jenkins/lib/Jenkins) or any other application (db, conf files, etc).
The backup folder should contain data of backup
The script should take care and delete backup folders older than 7 days. It needs to be passed as external argument to the script. 
Make a schedule to run such daily at 2:00AM 

