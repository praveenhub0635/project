FROM alpine:3.14
RUN apk add apache2
ENTRYPOINT ["mysql"]
