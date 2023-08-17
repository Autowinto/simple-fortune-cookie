FROM golang:latest

WORKDIR /home

ADD . /home/

RUN go build -o backend .

EXPOSE 9000

ENTRYPOINT ["/home/backend"]