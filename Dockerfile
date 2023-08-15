FROM alpine:3.18

RUN apk update && apk upgrade

RUN apk add lighttpd
RUN apk add php82 php82-pdo_sqlite php82-mbstring php82-cgi php82-session

ADD lighttpd.conf /etc/lighttpd/

RUN cd /var/www/localhost/htdocs/ && wget -O - 'https://github.com/maxpozdeev/mytinytodo/releases/download/v1.7.4/mytinytodo-v1.7.4.tar.gz' | gzip -d -c | tar -xvf -
RUN echo '<html><head><meta http-equiv=refresh content="0; url=/mytinytodo/"></head></html>' > /var/www/localhost/htdocs/index.html

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
