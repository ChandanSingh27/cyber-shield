#!/bin/bash
sudo snort -d -l /var/log/snort -h 192.168.194.16/24 -A console -c /etc/snort/snort.conf
