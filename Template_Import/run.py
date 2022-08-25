#!/usr/bin/env python3
import os
import subprocess

for path, subdirs, files in os.walk("/home/administrator/templates"):
    for name in files:
        if name.endswith('.yaml'):
            subprocess.call("./zabbix_template_import.py --url http://localhost/zabbix/api_jsonrpc.php --user Admin --password {your_password} " + os.path.join(path, name), shell=True)
