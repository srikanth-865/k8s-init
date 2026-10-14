#!/bin/bash

# 1. check whether /secrets/mysql-secret.txt exist
# 2. if exist export and remove
# 3. if not exist throw the error

if [ -f /secrets/mysql-secret.txt ]; then
   ROOT_PASSWORD=$(cat /secrets/mysql-secret.txt)
   echo ""Password accessed successfully""
   else
     echo "cant find the password"
    exit 1
fi  
 #we are giving in the env for runtime to this password
 export MYSQL_ROOT_PASSWORD=$ROOT_PASSWORD
 rm /secrets/mysql-secret.txt #remove file

 exec /usr/local/bin/docker-entrypoint.sh mysqld