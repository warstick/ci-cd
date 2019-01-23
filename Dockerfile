FROM alpine:3.7
MAINTAINER mani.jsui@gmail.com 

RUN apk update
RUN apk add nginx

RUN apk --update add python

RUN apk add py-pip
RUN pip --version

RUN pip install awscli
RUN aws --version

#checking node version
RUN apk add nodejs
RUN node --version

# checking npm version
RUN apk add npm
RUN npm --version
