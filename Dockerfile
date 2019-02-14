FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    vim \
    apt-utils \
    build-essential \
    nano \
    libsndfile-dev \
    unzip


# python3.6
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get install -y
RUN apt-get update -y
RUN apt-get install -y python3.6

# python3.6-dev
RUN apt-get install -y python3.6-dev

RUN mkdir src
COPY src src

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py

RUN python3.6 -m pip install -r src/requirements.txt

RUN echo 'alias python=python3.6' >> ~/.bashrc
RUN echo 'alias python3=python3.6' >> ~/.bashrc
RUN echo 'export LASER="/src/LASER"' >>  ~/.bashrc


WORKDIR src