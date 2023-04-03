FROM golang:1.20.2-bullseye

ENV TZ /usr/share/zoneinfo/Asia/Tokyo

ENV ROOT=/go/src/app
WORKDIR ${ROOT}

# ModuleモードをON
ENV GO111MODULE=on

RUN apt-get update && apt-get install -y \
    git \
    vim \
    zip \
    unzip \
    autoconf \
    gcc \
    g++ \
    make \
    curl \
    gnupg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# リロードの作業を自動化する機能
RUN go install github.com/cosmtrek/air@latest

# golangをデバッグする機能
RUN go install github.com/go-delve/delve/cmd/dlv@latest

CMD ["air", "-c", ".air.toml"]

