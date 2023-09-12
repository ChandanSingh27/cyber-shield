#!/bin/bash

sudo snort -d -l /var/log/snort/ -h 192.168.1.0/24 -A console -c /etc/snort/snort.conf