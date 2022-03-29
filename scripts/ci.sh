cd /home/praba_test
docker exec -i pms_web python3 manage.py makemigrations
docker exec -i pms_web python3 manage.py migrate