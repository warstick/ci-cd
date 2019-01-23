FROM alpine:3.7
MAINTAINER mani.jsui@gmail.com 

RUN apt-get update
RUN apt-get install –y nginx

RUN apt-get install python3-pip
RUN pip3 --version

RUN pip install awscli
RUN aws --version

#checking node version
RUN apt-get install nodejs
RUN node --version

# checking npm version
RUN apt-get install npm
RUN npm --version
