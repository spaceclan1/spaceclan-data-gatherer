############################
# STEP 1 build executable binary
############################
FROM golang:1.17 AS builder
WORKDIR /go/src/liderbet/application/
ADD code .
RUN go get -d -v ./...
RUN go build -o /go/bin/application main.go
############################
# STEP 2 build a small image
############################
FROM gcr.io/distroless/base-debian10
COPY --from=builder /go/bin/application /
CMD ["/application"]