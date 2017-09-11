#!/bin/bash

cd /srv/pycsw/
pycsw-admin.py -c load_records -r -f default.cfg -p /gisdata/metadata
