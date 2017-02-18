FROM java:alpine

MAINTAINER "--==RIX==--" <zeze0556@gmail.com>

RUN apk update \
    && apk add bash gcc glib g++ zip curl unzip linux-headers git python
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN sed -i 's/strcpy(alloca/strcpy((char*)alloca/g'  /usr/include/string.h
VOLUME /bazel
WORKDIR /bazel
