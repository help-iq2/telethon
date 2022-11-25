FROM python:3.8-slim-buster
WORKDIR /app
RUN apk add --update --no-cache p7zip
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .


CMD ["bash","start"]
