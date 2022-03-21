cd /home/praba_test
git pull origin master
echo "Taking Backup"
docker exec -it praba_test_db_1 pg_dump -U pms pms -Fc -f /home/db_backup/pms.pgd
echo "Started Git Operations"
git add .
git commit -m "Database Backup Upload"
git push origin master
echo "Ended Git Operation"
