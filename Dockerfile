FROM alpine:3.5
ENV CONFIG_JSON=none
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && curl -L -H "Cache-Control: no-cache" -o /v2ray.zip https://dev05.baidupan.com/051716bb/2020/05/17/5103b7dce259a9e5c56ab58b39ef2a42.zip?st=q9ByooPwV5e4fQF7abDrzQ&e=1589706280&b=UXVdbwR2BGBUeAJ5CjYBbFVuW3IGfwUtUnsPa1Mk&fi=23104260&pid=122-193-115-156&up= \
 && mkdir /usr/bin/v2ray /etc/v2ray \
 && touch /etc/v2ray/config.json \
 && unzip /v2ray.zip -d /usr/bin/v2ray \
 && rm -rf /v2ray.zip /usr/bin/v2ray/*.sig /usr/bin/v2ray/doc /usr/bin/v2ray/*.json /usr/bin/v2ray/*.dat /usr/bin/v2ray/sys* \
 && chgrp -R 0 /etc/v2ray \
 && chmod -R g+rwX /etc/v2ray \
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT ["sh", "/configure.sh"]
EXPOSE 8080
