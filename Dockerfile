FROM golang:1.15.7-buster
 WORKDIR /src
 COPY . .
 RUN go build -o /out/example .
 FROM scratch AS bin
 COPY --from=build /out/example /go/src/app
 RUN go get -u github.com/beego/bee
 ENV GO111MODULE=on
 ENV GOFLAGS=-mod=vendor
 ENV APP_USER app
 ENV APP_HOME /go/src/app
 ARG GROUP_ID
 ARG USER_ID
 RUN groupadd --gid $GROUP_ID app && useradd -m -l --uid $USER_ID --gid $GROUP_ID $APP_USER
 RUN mkdir -p $APP_HOME && chown -R $APP_USER:$APP_USER $APP_HOME
 USER $APP_USER
 WORKDIR $APP_HOME
 EXPOSE 8080
 CMD ["bee", "run"]