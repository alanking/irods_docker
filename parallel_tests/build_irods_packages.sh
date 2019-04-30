#! /bin/bash

# Clone iRODS repo and initialize.
git clone $IRODS_BUILD_IRODS_REPO /irods && cd /irods
git checkout $IRODS_BUILD_IRODS_COMMIT
git submodule update --init

# Build iRODS.
mkdir /irods_build && cd /irods_build
cmake -GNinja /irods
ninja package

# Install packages for building iCommands.
dpkg -i irods-{runtime,dev}*.deb

# Clone iCommands repo.
git clone $IRODS_BUILD_ICOMMANDS_REPO /irods_client_icommands && cd /irods_client_icommands
git checkout $IRODS_BUILD_ICOMMANDS_COMMIT

# Build and install iCommands.
mkdir /icommands_build && cd /icommands_build
cmake -GNinja /irods_client_icommands
ninja package
