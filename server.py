from waitress import serve
from app.wsgi import application
if __name__ == '__main__':
    print("Started Application.....")
    serve(application, port = '8001')