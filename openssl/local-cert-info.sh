#!/bin/bash

openssl x509 -in $1 -noout -text \
  | grep -E 'Subject:|Not Before:|Not After :' \
  | sed 's/^[ \t]*//; s/[ \t]*$//'
