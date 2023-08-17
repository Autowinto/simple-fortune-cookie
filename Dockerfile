FROM golang:latest

RUN mkdir /app

WORKDIR /app

ADD . /app/

RUN go get github.com/Autowinto/simple-fortune-cookie && cd fronted && go build -o app/main

ENTRYPOINT ["/app/main"]