FROM alpine:3.12
ENV TZ=Asia/Shanghai
ENV DOMAIN=youdomain.com
ENV Ali_Key="sdfsdfsdfljlbjkljlkjsdfoiwje"
ENV Ali_Secret="jlsdflanljkljlfdsaklkjflsa"

RUN set -ex \
	&& apk add --no-cache tzdata ca-certificates unzip wget curl nginx openssl socat

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
