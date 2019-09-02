# PHP for Magento 2

[![Docker Hub downloads](https://img.shields.io/docker/pulls/qwertyre/magento2-varnish)](https://hub.docker.com/r/qwertyre/magento2-varnish)
[![Travis](https://img.shields.io/travis/qwerty-re/docker-magento2-varnish)](https://travis-ci.org/qwerty-re/docker-magento2-varnish)
[![License](https://img.shields.io/github/license/qwerty-re/docker-magento2-varnish)](https://github.com/qwerty-re/docker-magento2-varnish/blob/master/LICENSE)

[![Stars](https://img.shields.io/github/stars/qwerty-re/docker-magento2-varnish?style=social)](https://github.com/qwerty-re/docker-magento2-varnish/stargazers)
[![Forks](https://img.shields.io/github/forks/qwerty-re/docker-magento2-varnish?style=social)](https://github.com/qwerty-re/docker-magento2-varnish/network/members)

##### Versions
[![Varnish version](https://img.shields.io/badge/Varnish-5.2.1-green)](https://varnish-cache.org/docs/5.2/index.html)
[![Devian version](https://img.shields.io/badge/debian-stretch_(slim)-green?logo=debian)](https://www.debian.org/releases/stretch/)

##### Supported Magento versions
![Magento2.2.x](https://img.shields.io/badge/Magento-2.2.x-green?logo=magento)
![Magento2.3.x](https://img.shields.io/badge/Magento-2.3.x-green?logo=magento)

##### Description

This is docker image for Varnish with Magento 2 configuration.

**IMPORTANT**:

1. Nginx container must be named `DOCKERIZED_MAGENTO2_NGINX`. If you want to change it, download [default.vcl](https://github.com/qwerty-re/docker-magento2-varnish/blob/master/container/etc/varnish/default.vcl) and override it with volumes attribute on docker.
2. Varnish container name must be lower case, this is related with [issue/31](https://github.com/zendframework/zend-uri/issues/31) in zendframework/zend-uri. Otherwise your magento can't connect to varnish.

##### Example docker-compose

```yaml
  dockerized_magento2_varnish:
      container_name: dockerized_magento2_varnish
      image: qwertyre/magento2-varnish:latest
      network_mode: "DOCKER_network"
      labels:
        - "traefik.backend=dockerized_magento2_varnish"
        - "traefik.port=80"
        - "traefik.frontend.rule=Host:magento.qwerty.re"
        - "traefik.docker.network=DOCKER_network"
      depends_on:
        - dockerized_magento2_nginx
  ...
```

