FROM docker:latest

MAINTAINER Weissteiner Hannes <h.weissteiner@gmail.com>

RUN apk update && apk add postgresql-client && rm -rf /var/cache/apk/* && touch /var/log/janitor.sql

COPY ./exec-janitor.sh /etc/periodic/weekly
COPY ./clear-log.sh /etc/periodic/monthly
COPY ./synapse-janitor.sql /usr/share/misc

RUN chmod +x /etc/periodic/weekly/exec-janitor.sh /etc/periodic/monthly/clear-log.sh

CMD /etc/periodic/weekly/exec-janitor.sh && tail -f /var/log/janitor.sql

