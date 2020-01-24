FROM aptiv_irods-catalog-consumer:latest

RUN apt install -y irods-database-plugin-postgres

COPY setup_provider.input /

ADD start_provider.sh /
RUN chmod u+x /start_provider.sh
ENTRYPOINT ["./start_provider.sh"]
