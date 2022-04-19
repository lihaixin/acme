FROM alpine:3.12
ENV TZ=Asia/Shanghai
ENV DOMAIN=youdomain.com
ENV DP_Id=126692
ENV DP_Key=46355cda964d7712e71cc370d319f440

RUN set -ex \
	&& apk add --no-cache tzdata ca-certificates unzip wget curl nginx openssl socat bash dcron

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
