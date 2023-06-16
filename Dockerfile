# syntax=docker/dockerfile:1
FROM golang:1.20
LABEL version="1.0.0"
LABEL description="golang-web"
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /golang-web
EXPOSE 8080
CMD ["/golang-web"]
