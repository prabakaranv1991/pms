docker exec -it praba_test_db_1 pg_dump -U pms pms -Fc -f /home/db_backup/pms.pgd
git add .
git commit -m "Backup Upload"
git push origin master
