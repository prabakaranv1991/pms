# **Docker Commands**

## Up the server
>docker-compose up -d --build
## Down the servers
>docker-compose down
## Starting cronjob
>docker exec -it pms_web_1 service cron start
## Database Backup
>docker exec -it pms_db_1 pg_dump -U pms pms -Fc -f /home/db_backup/pms.pgd
## Database Restore
>docker exec -it pms_db_1 pg_restore -j 8 -d pms /home/db_backup/pms.pgd
## Bash
>docker exec -it pms_web_1 /bin/bash

<br /><hr /><br />

# **Directory Structure**
## Application
    .\app
## Database
    .\database
## Database Backup
    .\db_backup