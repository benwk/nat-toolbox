FROM golang:1.7.1-alpine
#FROM alpine/git

LABEL maintainer="benwk<z@benwk.com>"

ARG NGROK_DOMAIN ${NGROK_DOMAIN}

WORKDIR /app
RUN mkdir -p /app /app/clients
RUN apk add --no-cache git make openssl
#RUN go env -w GO111MODULE=auto

ADD build.sh /app
RUN git clone https://github.com/inconshreveable/ngrok.git --depth=1 ngrok
RUN sh ./build.sh
EXPOSE 8081
VOLUME [ "/app/ngrok" ]
CMD [ "/app/ngrok/bin/ngrokd"]