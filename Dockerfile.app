# pull official base image
FROM ubuntu:20.04

# set work directory
WORKDIR /usr/src/app

RUN apt-get update

RUN apt-get update && \
    apt-get install -y python3-pip \
    locales \
    postgresql-client \
    cron && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# install dependencies
RUN pip3 install -U wheel setuptools install
COPY ./app/requirements.txt .

RUN pip3 install -r requirements.txt

RUN export LC_ALL=en_IN.utf8

RUN rm -rf ~/.cache/pip