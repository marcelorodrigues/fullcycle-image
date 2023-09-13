FROM golang:1.13.8-alpine3.11 as build 
WORKDIR /go/src/fullcycle 
COPY fullcycle.go . 
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /go/src/fullcycle

FROM scratch
COPY --from=build /go/src/fullcycle /go/src/fullcycle
ENTRYPOINT ["/go/src/fullcycle/fullcycle"]