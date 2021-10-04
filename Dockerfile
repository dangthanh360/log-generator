FROM golang

ENV CGO_ENABLED=0
ENV GO111MODULE=on

WORKDIR /go/src/flog

COPY go.mod go.sum ./
RUN go mod download

COPY . ./
RUN go build -o /bin/flog

#FROM scratch
FROM ubuntu:focal
# Install curl, wget, nc ad logger
RUN apt-get update && apt-get install -y curl wget netcat bsdutils

COPY --from=0 /bin/flog /bin/flog

ENV SYSLOG_HOST=localhost
ENV SYSLOG_PORT=5001

#ENTRYPOINT ["flog"]
CMD ["flog"]