FROM alpine:latest
RUN	apk update && apk upgrade && apk add --no-cache nginx openssl
WORKDIR /var/www
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
