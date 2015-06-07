FROM zoni/ubuntu
MAINTAINER Nick Groenen

# Prevent console output from being buffered and not displaying right
ENV __FLUSH_LOG 1

ADD bin/build*.sh /
RUN /build1.sh && rm /build*.sh

ADD bin/start.sh /
ENTRYPOINT ["/start.sh"]

VOLUME /var/lib/prosody/
EXPOSE 5222 5269
