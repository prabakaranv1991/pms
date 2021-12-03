# pull official base image
FROM python:alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update \
    && apk add --no-cache python3-dev libstdc++ \
    postgresql-dev gcc python3-dev musl-dev g++

# install dependencies
RUN pip install --upgrade pip
RUN pip install -U pip wheel setuptools install
COPY ./app/requirements.txt .

RUN pip3 install -r requirements.txt


# copy project
COPY . .