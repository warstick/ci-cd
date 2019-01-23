FROM alpine:3.7
MAINTAINER mani.jsui@gmail.com 

RUN apk update
RUN apk install –y nginx

RUN apk install python3-pip
RUN pip3 --version

RUN pip install awscli
RUN aws --version

#checking node version
RUN apk install nodejs
RUN node --version

# checking npm version
RUN apk install npm
RUN npm --version
