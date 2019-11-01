#! /bin/bash

# Start the Postgres database.
service postgresql start
counter=0
until pg_isready -q
do
    sleep 1
    ((counter += 1))
done
echo Postgres took approximately $counter seconds to fully start ...

# Set up iRODS.
python /var/lib/irods/scripts/setup_irods.py < /var/lib/irods/packaging/localhost_setup_postgres.input

python /configure_federation.py

su - irods -c "iadmin mkzone $REMOTE_ZONE remote $REMOTE_HOST:1247"
su - irods -c "iadmin mkuser rods#$REMOTE_ZONE rodsuser"

# Keep container running if the test fails.
tail -f /dev/null
# Is this better? sleep 2147483647d

