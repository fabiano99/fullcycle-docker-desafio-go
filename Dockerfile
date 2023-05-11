FROM golang:1.19 AS build

WORKDIR /app
COPY ./app /app

RUN go build -o main main.go

FROM scratch
WORKDIR /app
COPY --from=build /app/main ./
CMD ["./main"]
