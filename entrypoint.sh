#!/bin/sh
cd /var/www
meteor create test
cd test
nohup meteor --port 80
