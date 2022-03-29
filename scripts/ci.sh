cd /home/praba_test
docker exec -i praba_test_web_1 python3 manage.py makemigrations
docker exec -i praba_test_web_1 python3 manage.py migrate