FROM --platform=${TARGETPLATFORM} lihaixin/base:3.16

ENV TZ=Asia/Shanghai
ENV DOCKERID=acme

ENV TYPE=letsencrypt
ENV DNS=dns_cf
ENV DOMAIN=youdomain.com
ENV aliasDOMAIN=
ENV ID=info@youdomain.com
ENV KEY=558ef6820cea14627f986548c96fcb6cb****
ENV BASHPROXY=1

RUN set -ex \
	&& apk add --no-cache tzdata \
	ca-certificates \
	unzip wget curl \
	nginx openssl socat \
	dcron bash \
	openssl \
        openssh-client \
        coreutils \
        bind-tools \
        sed \
        oath-toolkit-oathtool \
        tar \
        libidn \
        jq

COPY .bashrc /root/.bashrc
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
