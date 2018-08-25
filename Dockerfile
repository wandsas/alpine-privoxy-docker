FROM alpine:latest
MAINTAINER Sascha Wander <sascha.wander@gmail.com>

RUN apk --no-cache add privoxy

EXPOSE 8118

COPY privoxy.conf /etc/privoxy/config

RUN chown -R privoxy /etc/privoxy

USER privoxy

ENTRYPOINT [ "privoxy", "--no-daemon" ]
CMD [ "/etc/privoxy/config" ]

# vim:fenc=utf-8:ft=dockerfile:ts=2:sts=0:sw=2:et:
