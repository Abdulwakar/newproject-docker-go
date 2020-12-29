FROM golang:alpine AS builder
WORKDIR /build
COPY . .
RUN go build
RUN ls -la .

#Build small image
FROM alpine
COPY --from=builder /build/tst /
ENTRYPOINT ["/main"]

