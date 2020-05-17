FROM alpine:3.5
ENV CONFIG_JSON=none
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && curl -L -H "Cache-Control: no-cache" -o /v2ray.zip https://sh-download-ipv6.ftn.qq.com/ftn_handler/1cd4d3982d3b05c28acfdf9597de20330faae7fd10e266a022edc73f163d744706ae238d34e479a4eb678447b500b74fb067c1ecb5da285470f83765e06cbdb0/?fname=v2ray-linux.zip&k=76373736620774c99dca3826153100190005565404010a571f040602041c0653560f1a540108061b0206030107040b0651525555333e32400045564f1e5d5b58474f194c5a41320b&code=27763126&fr=00&&txf_fid=09bea8b05e18ce43ddccbb8754133541cab71657&xffz=12175791 \
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
