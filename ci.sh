cd /home/praba_test
git pull
docker-compose down
docker-compose up -d
docker exec -it praba_test_web_1 python3 manage.py makemigrations
docker exec -it praba_test_web_1 python3 manage.py migrate
