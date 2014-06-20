#
# Cookbook Name:: es-curator
# Recipe:: default
#
# Copyright (C) 2014 =David F. Severski
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

# curator requires argparse
python_pip "argparse"

# install latest currator into system path
python_pip "elasticsearch-curator"

# schedule deletions
if node['elasticsearch-curator']['days_to_keep']
  cron_d 'es-curator-delete' do
    minute  0
    hour    "#{node['elasticsearch-curator']['hour_to_run']}"
    command "/usr/local/bin/curator delete --older-than #{node['elasticsearch-curator']['days_to_keep']} --host #{node['elasticsearch-curator']['elasticsearch_server']}"
  end
end

# schedule optimizations
if node['elasticsearch-curator']['optimize_indices_older_than']
  cron_d 'es-curator-delete' do
    minute  0
    hour    "#{node['elasticsearch-curator']['hour_to_run']}"
    command "/usr/local/bin/curator optimize --older-than #{node['elasticsearch-curator']['optimize_indices_older_than']} --host #{node['elasticsearch-curator']['elasticsearch_server']}"
  end
end

# schedule backups
if node['elasticsearch-curator']['snapshot_repository']
  cron_d 'es-curator-backup' do
  	weekday :saturday
    minute  0
    hour    "#{node['elasticsearch-curator']['hour_to_run']}"
    command "/usr/local/bin/curator snapshot --host #{node['elasticsearch-curator']['elasticsearch_server']} --repository #{node['elasticsearch-curator']['snapshot_repository']}"
  end
end