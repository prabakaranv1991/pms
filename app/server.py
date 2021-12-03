from waitress import serve
from wsgi import application
if __name__ == '__main__':
    print("Started Application.....")
    serve(application, port = '8001')