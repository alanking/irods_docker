git clone https://github.com/irods/irods-legacy

cd irods-legacy/iRODS

cat /irods.config
cp /irods.config config/irods.config
./scripts/irodsprompt

./scripts/configure

make

#yes | ./scripts/finishSetup
