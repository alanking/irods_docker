FROM ubuntu:14.04

RUN adduser irods

# Set up base set of packages and clone irods-legacy repo
RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y apt-transport-https wget git make gcc unixodbc postgresql g++ unixodbc-dev libpq-dev odbc-postgresql

# set up irods role in th edatabase
COPY db_commands.txt /
RUN service postgresql start && su - postgres -c 'psql -f /db_commands.txt'

# some ODBC preparation for the server
RUN su irods -c "cp /etc/odbcinst.ini /home/irods/.odbc.ini"
RUN ln -s /usr/lib/x86_64-linux-gnu/odbc/psqlodbcw.so /usr/lib/postgresql/9.3/lib/libodbcpsql.so

# Build iRODS to run in place
COPY irods.config /irods.config
COPY setup_irods.sh /setup_irods.sh
RUN chmod +x /setup_irods.sh
RUN DEBIAN_FRONTEND=noninteractive && service postgresql start && su - irods -c '/setup_irods.sh'

# Set command to execute when launching the container.
ADD start.sh /
RUN chmod u+x /start.sh
ENTRYPOINT ["./start.sh"]
