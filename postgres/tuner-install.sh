#!/bin/bash

apt install libdbd-pg-perl libdbi-perl perl-modules wget
wget -O postgresqltuner.pl postgresqltuner.pl
chmod +x postgresqltuner.pl
