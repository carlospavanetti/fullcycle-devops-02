FROM golang:alpine AS build-env

ADD . /src

RUN cd /src && go build -o main.out


FROM scratch

WORKDIR /app
COPY --from=build-env /src/main.out /app/

ENTRYPOINT ./main.out