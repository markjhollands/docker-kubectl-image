FROM alpine:3.9 as builder

WORKDIR /tmp

RUN apk add curl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x kubectl

FROM alpine:3.9

COPY --from=builder /tmp/kubectl /usr/local/bin
RUN mkdir -p /root/.kube
WORKDIR /app