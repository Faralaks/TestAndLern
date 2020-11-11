FROM golang:1.15.2

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
EXPOSE 57600

RUN go build -o run main.go

RUN chmod +x run

CMD ["./run"]