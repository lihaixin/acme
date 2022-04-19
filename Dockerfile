FROM alpine:3.12
ENV TZ=Asia/Shanghai
ENV DOMAIN=youdomain.com
ENV Namesilo_Key=d9d58d00d2fc57d3a69cbd


RUN set -ex \
	&& apk add --no-cache tzdata ca-certificates unzip wget curl nginx openssl socat bash dcron

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
