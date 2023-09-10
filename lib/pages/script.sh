#!/bin/bash

mpstat -P ALL 1 1 | awk '/^Average:/ {print "CPU Usage: " 100 - $NF"%"}'