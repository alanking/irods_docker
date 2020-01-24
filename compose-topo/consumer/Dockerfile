FROM aptiv_irods-client-icommands:latest

RUN apt install -y irods-server

ADD start_consumer.sh irods_consumer.input /
RUN chmod u+x /start_consumer.sh

RUN curl -fSL https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-linux-amd64-v0.6.1.tar.gz -o dockerize-linux-amd64-v0.6.1.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v0.6.1.tar.gz

ENV provider_host irods-catalog-provider
ENTRYPOINT exec dockerize -wait tcp://$provider_host:1247 -timeout 250s /start_consumer.sh
