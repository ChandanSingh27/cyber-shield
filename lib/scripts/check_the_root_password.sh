#!/bin/bash

sudo sudo -i

# ip addr show | grep -oE 'inet ([0-9]{1,3}\.){3}[0-9]{1,3}' | awk '{print $2}'