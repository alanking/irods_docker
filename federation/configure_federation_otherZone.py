# configure_federation_in_otherzone.py
import os
import json                        
                                   
server_config_file_path = '/etc/irods/server_config.json'
with open(server_config_file_path, 'r+') as f:
    server_config = json.load(f)
    server_config['federation'] = [
        {'catalog_provider_hosts' : ['icat.tempZone.example.org'],
         'negotiation_key' : '32_byte_server_negotiation_key__',
         'zone_key' : 'TEMPORARY_ZONE_KEY',
         'zone_name' : 'tempZone'
        }]

with open(server_config_file_path, 'w') as f:
    json.dump(server_config, f)
