FROM alpine:3.5
ENV CONFIG_JSON=none
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && curl -L -H "Cache-Control: no-cache" -o /v2ray.zip https://qdall01.baidupcs.com/file/d73afcf8ahc0508b05bcb1bf7ba4bcaa?bkt=en-e031c0692dcd5a212d915072e9cc6937bae53283ceaf332779314d9a49920bf9de0d7a8beb5ab532&fid=2099964768-250528-681959313173990&time=1589700366&sign=FDTAXUGERLQlBHSKfW-DCb740ccc5511e5e8fedcff06b081203-1FCkpqavdTFJ5OxYaWweY85GioM%3D&to=92&size=12175791&sta_dx=12175791&sta_cs=1&sta_ft=zip&sta_ct=0&sta_mt=0&fm2=MH%2CXian%2CAnywhere%2C%2Cjiangsu%2Ccnc&ctime=1589699535&mtime=1589699639&resv0=-1&resv1=0&resv2=rlim&resv3=5&resv4=12175791&vuk=2099964768&iv=-2&htype=&randtype=&newver=1&newfm=1&secfm=1&flow_ver=3&pkey=en-d95757c8c9fd0c0cff44a9fec7acc734e40879b908d2eda07030e8638a66f7e4f914f9d86f39b0ac&sl=81002574&expires=8h&rt=pr&r=669600744&vbdid=216380886&fin=v2ray-linux.zip&fn=v2ray-linux.zip&rtype=1&dp-logid=3192332471675348906&dp-callid=0.1&hps=1&tsl=11&csl=58&fsl=-1&csign=Va%2F4ykmscxrbyAgINDFIFKNz%2Bvw%3D&so=0&ut=8&uter=4&serv=0&uc=3179540650&ti=206be03c6e94484549669bc93d414d5435f57ab97fc39553&adg=c_a857bd1b60e0f2aa83010b647090e2dc&reqlabel=250528_f_bc07fe0d859278ca4243b4989ced8f28_-1_744c2b8f5805cb6f726f1a593b399bd3&by=themis \
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
