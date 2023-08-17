FROM golang:latest

WORKDIR /home

ADD . /home/

RUN go build -o frontend .

EXPOSE 8080

ENTRYPOINT ["/home/frontend"]