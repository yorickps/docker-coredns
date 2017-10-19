# Docker coredns

[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/yorickps/coredns/builds/)
[![Build Status](https://travis-ci.org/yorickps/docker-coredns.svg?branch=master)](https://travis-ci.org/yorickps/docker-coredns)

Docker image to run [CoreDNS](https://coredns.io/)

Example command to run CoreDNS in a container, adding the example config from the repo. This sets up CoreDNS as a proxy, for sending DNS request to Google using HTTPS

```bash
docker run -m 100m --expose=53 --expose=53/udp -p 53:53 -p 53:53/udp -v "$PWD"/config:/etc/coredns --restart=on-failure --name coredns yorickps/coredns
```

To run CoreDNS as an authorative DNS server for a zone, add the appropriate zone file in the config directory and adjust the [Corefile](https://coredns.io/2017/07/23/corefile-explained/).

For more CoreDNS info, check the [Quick Start guide](https://coredns.io/2017/07/24/quick-start/)
