FROM alpine:3.12
ENV TZ=Asia/Shanghai
ENV DOMAIN=youdomain.com
ENV CF_Email=info@youdomain.com
ENV CF_Key=558ef6820cea14627f986548c96fcb6cb****

RUN set -ex \
	&& apk add --no-cache tzdata ca-certificates unzip wget curl nginx openssl socat dcron bash

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
