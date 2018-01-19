FROM derker/ubuntu:latest
MAINTAINER derker <893309018@qq.com>
WORKDIR /root
COPY lantern-installer-64-bit.deb /root
RUN apt-get update  && \
	apt-get -y install libappindicator3-1 && \
        dpkg -i lantern-installer-64-bit.deb && \
        apt-get -f install && \
	rm -rf lantern-installer-64-bit.deb && \
        apt-get clean && \
        rm -rf /var/cache/apt/* /var/lib/apt/lists/*
EXPOSE 8888/tcp 9999/tcp
ENTRYPOINT ["/usr/bin/lantern", "--configdir=/root", "--headless=true", "--proxyall=true", "--startup=false", "--clear-proxy-settings=false", "--addr=0.0.0.0:9999", "--uiaddr=0.0.0.0:8888"]
