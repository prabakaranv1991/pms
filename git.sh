cd /home/praba_test
git pull
echo "Taking Backup"
docker exec praba_test_db_1 pg_dump -U pms pms -Fc -f /home/db_backup/pms.pgd
echo "Started Git Operations"
git add .
git commit -m "Database Backup Upload"
git push origin master
echo "Ended Git Operations"
