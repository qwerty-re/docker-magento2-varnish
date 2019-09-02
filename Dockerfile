FROM debian:stretch-slim
LABEL maintainer="Mateusz Lerczak <mateusz@lerczak.eu>"

FROM debian:stretch-slim

ENV VARNISH_VERSION=5.2.1-1~stretch

RUN set -ex \
	&& apt update \
	&& apt install -y --no-install-recommends apt-transport-https ca-certificates gnupg curl \
    && curl -L https://packagecloud.io/varnishcache/varnish52/gpgkey | apt-key add - \
	&& echo 'deb https://packagecloud.io/varnishcache/varnish52/debian stretch main' > /etc/apt/sources.list.d/varnish.list \
	&& apt update \
	&& apt install -y --no-install-recommends varnish=$VARNISH_VERSION \
	&& apt purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false gnupg \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /etc/varnish

COPY container /
ENTRYPOINT ["docker-varnish-entrypoint"]

EXPOSE 80
CMD ["varnishd", "-F", "-f", "/etc/varnish/default.vcl"]