docker exec pms_db pg_dump -U pms pms -Fc -f /home/db_backup/pms.pgd
git add .
git commit -m "Database Backup Upload"
git push origin master
