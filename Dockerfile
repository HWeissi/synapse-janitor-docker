FROM docker:latest

MAINTAINER Weissteiner Hannes <h.weissteiner@gmail.com>

RUN apk update && apk add postgresql-client && rm -rf /var/cache/apk/* && touch /var/log/janitor.log

COPY ./exec-janitor.sh /etc/periodic/weekly
COPY ./clear-log.sh /etc/periodic/monthly

RUN wget https://raw.githubusercontent.com/xwiki-labs/synapse_scripts/master/synapse_janitor.sql -O /usr/share/misc/synapse-janitor.sql

RUN chmod +x /etc/periodic/weekly/exec-janitor.sh /etc/periodic/monthly/clear-log.sh

CMD crond && tail -f /var/log/janitor.log

