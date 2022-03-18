FROM golang:1.7.1-alpine
#FROM alpine/git

LABEL maintainer="benwk<z@benwk.com>"

ARG NGROK_DOMAIN ${NGROK_DOMAIN}

WORKDIR /app
RUN mkdir -p /app
RUN apk add --no-cache git make openssl

ADD build.sh /app
RUN git clone https://github.com/inconshreveable/ngrok.git --depth=1 ngrok
RUN sh ./build.sh
EXPOSE 8081
VOLUME [ "/app/ngrok" ]
CMD [ "/app/ngrok/bin/ngrokd"]