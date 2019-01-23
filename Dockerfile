FROM alpine:3.7
MAINTAINER mani.jsui@gmail.com 

RUN apk update
RUN apk add nginx

RUN apk add python3-pip
RUN pip3 --version

RUN pip install awscli
RUN aws --version

#checking node version
RUN apk add nodejs
RUN node --version

# checking npm version
RUN apk add npm
RUN npm --version
