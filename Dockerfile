FROM golang:1.19.13-alpine AS builder
WORKDIR /usr/src/app
COPY . .
RUN go build -o application main.go

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .
ENTRYPOINT [ "./application" ]