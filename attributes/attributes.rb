#
# Cookbook Name:: es-curator
# Attributes:: default
#

default['elasticsearch-curator']['days_to_keep'] =            nil
default['elasticsearch-curator']['elasticsearch-server'] =    'localhost'
default['elasticsearch-curator']['hour_to_run'] =             '9'
default['elasticsearch-curator']['optimize_indices_after'] =  nil
default['elasticsearch-curator']['snapshot_repository'] =     nil
default['elasticsearch-curator']['backup_weekday'] =          '6'
default['elasticsearch-curator']['timeout'] =                 '900'
default['elasticsearch-curator']['backup_indicies_older_than'] = 2
default['elasticsearch-curator']['delete_snapshots_older_than'] = 7
default['elasticsearch-curator']['bin_dir'] =                 '/usr/bin'