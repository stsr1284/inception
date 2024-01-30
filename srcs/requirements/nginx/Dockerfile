FROM    debian:bullseye

RUN     apt-get update && \
        apt-get upgrade && \
        apt-get -y install nginx openssl


COPY    ./conf/default /etc/nginx/sites-available

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/dong.key -out /etc/ssl/dong.crt \
        -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=dong"

RUN     chmod 700 /etc/ssl/dong.crt
RUN     chmod 700 /etc/ssl/dong.key


ENTRYPOINT ["nginx", "-g", "daemon off;"]
