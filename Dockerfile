FROM alpine

ENV GOPATH=/go

RUN apk add --update --no-cache go git musl-dev && \
    mkdir /go && \
    go get github.com/p4tin/goaws/... && \
    go build -o /goaws /go/src/github.com/p4tin/goaws/app/cmd/goaws.go && \
    rm -rf /go && \
    apk del go git musl-dev

EXPOSE 4100

ENTRYPOINT ["/goaws"]
