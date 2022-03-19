FROM golang:1.18-alpine

LABEL maintainer="benwk<z@benwk.com>"

ARG NGROK_DOMAIN ${NGROK_DOMAIN}

WORKDIR /app
RUN mkdir -p /app /app/clients
RUN apk add --no-cache git make openssl
RUN go env -w GO111MODULE=auto

ADD *.sh /app
ADD ./ngrok /app/ngrok
RUN sh ./build.sh
EXPOSE 4443
EXPOSE 80
EXPOSE 443
VOLUME [ "/app/ngrok" ]
CMD [ "/app/ngrok/bin/ngrokd"]