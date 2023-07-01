docker exec -it pms_db pg_dump -U pms pms -Fc -f /home/db_backup/pms.pgd; cd /Volumes/WORK/pms; git add .; git commit -m "DB Backup"; git push origin master
