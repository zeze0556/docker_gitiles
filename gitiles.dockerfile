FROM bazel-build

MAINTAINER "--==RIX==--" <zeze0556@gmail.com>


COPY build/bazel/output/bazel /usr/bin/
ADD build/gitiles /root/gitiles
ADD gitiles.config /git/gitiles.config
ADD start.sh /start.sh

VOLUME /git/repo
EXPOSE 8080

WORKDIR /git/repo
CMD ["/start.sh"]

