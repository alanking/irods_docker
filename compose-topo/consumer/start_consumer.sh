#! /bin/bash
sed -i '5s/.*/'$topo_provider'/'
python /var/lib/irods/scripts/setup_irods.py < /irods_consumer.input
tail -f /dev/null
