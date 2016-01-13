FROM debian:jessie

RUN { \
	set -ex; \
	MURMUR_VERSION=1.2.13; \
	DEPS="openssl ca-certificates"; \
	DEPS_BUILD="wget bzip2"; \
	apt-get update; \
	apt-get install --no-install-recommends -y $DEPS $DEPS_BUILD; \
	cd /tmp; \
	wget \
		"https://github.com/mumble-voip/mumble/releases/download/${MURMUR_VERSION}/murmur-static_x86-${MURMUR_VERSION}.tar.bz2" \
		--output-document="murmur.tar.bz2"; \
	tar --bzip2 -xf murmur.tar.bz2; \
	mv murmur-static_x86-${MURMUR_VERSION}/murmur.x86 /usr/bin/murmurd; \
	groupadd -r mumble-server; \
	useradd -r -g mumble-server mumble-server; \
	apt-get remove -y $DEPS_BUILD; \
	apt-get autoremove -y; \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*; \
}

EXPOSE 64738/tcp 64738/udp

COPY murmur-config.ini /opt/

COPY start-murmur /usr/bin/
CMD ["start-murmur"]
