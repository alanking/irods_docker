#! /bin/bash
counter=0
until pg_isready -h icat -d ICAT -q
do
    sleep 1
    ((counter += 1))
done
echo Postgres took approximately $counter seconds to fully start ...

python /var/lib/irods/scripts/setup_irods.py < /setup_provider.input

tail -f /dev/null
