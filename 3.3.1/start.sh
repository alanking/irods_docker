#! /bin/bash

service postgresql start

#su irods -c "cd irods-legacy/iRODS && ./irodsctl start"
su - irods -c "cd irods-legacy/iRODS && yes | ./scripts/finishSetup && ./irodsctl restart"

# Keep container running if the test fails.
# Is this better? sleep 2147483647d
tail -f /dev/null

