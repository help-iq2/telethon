FROM python:3.9.2-slim-buster

ENV PIP_NO_CACHE_DIR 1

RUN sed -i.bak 's/us-west-2\.ec2\.//' /etc/apt/sources.list

# Installing Required Packages
RUN apt update && apt upgrade -y && \
    	apt install --no-install-recommends -y \
	bash \
	curl \
	debian-archive-keyring \
	debian-keyring \
	ffmpeg \
	figlet \
	gcc \
	git \
	jq \
	libcurl4-openssl-dev \
	libffi-dev \
	libgconf-2-4 \
	libjpeg62-turbo-dev \
	libjpeg-dev \
	libmagickwand-dev \
	libopus0 \
	libopus-dev \
	libpq-dev \
	libreadline-dev \
	libsqlite3-dev \
	libssl-dev \
	libwebp-dev \
	libxi6 \
	libxml2-dev \
	libxslt1-dev \
	libyaml-dev \
	linux-headers-amd64 \
	make \
	mediainfo \
	megatools \
	musl \
	musl-dev \
	neofetch \
	openssl \
	p7zip-full \
	postgresql \
	postgresql-client \
	pv \
	python3-dev \
	python3-lxml \
	tree \
	unzip \
	util-linux \
	wget \
	xvfb \
	zlib1g \
	zlib1g-dev \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives /tmp
    
# Pypi package Repo upgrade
RUN pip3 install --upgrade pip setuptools

ENV LANG C.UTF-8

#install chromedriver
RUN mkdir /tmp/
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE)/chromedriver_linux64.zip 
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/bin/ 
RUN rm /tmp/chromedriver.zip

#clonning repo 
RUN git clone -b test1 https://github.com/sandy1709/catuserbot.git /root/userbot
#working directory 
WORKDIR /root/userbot

# Install requirements
RUN pip3 install -U -r requirements.txt

ENV PATH="/home/userbot/bin:$PATH"

CMD ["python3","-m","userbot"]
