FROM    debian:bullseye

RUN     apt-get update && \
        apt-get upgrade && \
        apt-get -y install mariadb-server mariadb-client && \
        mkdir -p /var/run/mysqld /var/lib/mysql && \
        chown -R mysql:mysql /var/run/mysqld /var/lib/mysql

COPY    ./conf/my.cnf /etc/mysql/
COPY    ./tools/entry.sh /
RUN     chmod +x /entry.sh

ENTRYPOINT [ "sh", "/entry.sh" ]