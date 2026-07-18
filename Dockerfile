FROM alpine:latest

WORKDIR /app

COPY app.sh build.sh test.sh ./
RUN chmod +x app.sh build.sh test.sh

CMD ["./app.sh"]
