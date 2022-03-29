cd /home/praba_test
git pull
docker-compose down
docker-compose up -d
docker exec praba_test_db_1 pg_dump -U pms pms -Fc -f /home/db_backup/pms.pgd
docker exec -it praba_test_web_1 python3 manage.py makemigrations
docker exec -it praba_test_web_1 python3 manage.py migrate
git add .
git commit -m "Database Backup Upload"
git push origin master
