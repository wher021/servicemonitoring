FROM golang:1.13 as builder


WORKDIR /app/server

#COPY go.mod go.mod
#COPY go.sum go.sum

#RUN go mod download

COPY main.go main.go


RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on go build -a -o willy main.go

#EXPOSE 8082

ENTRYPOINT ["./willy"]
