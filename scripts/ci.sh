cd /home/praba_test
git pull
sleep 10s
docker exec praba_test_web_1 python3 manage.py makemigrations
docker exec praba_test_web_1 python3 manage.py migrate