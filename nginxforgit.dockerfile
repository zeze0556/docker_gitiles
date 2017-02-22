FROM nginx:alpine

MAINTAINER "--==RIX==--" <zeze0556@gmail.com>

RUN apk add --no-cache git fcgiwrap

COPY start_nginx.sh /start.sh
CMD ["/start.sh"]