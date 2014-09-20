FROM t128/base

ADD docker /docker
RUN /docker/install
ADD image /

EXPOSE 64738
VOLUME /data
