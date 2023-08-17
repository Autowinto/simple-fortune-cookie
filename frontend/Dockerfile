FROM golang:latest

WORKDIR /home

ADD . /home/

RUN go build -o frontend .

ENTRYPOINT ["/home/frontend"]