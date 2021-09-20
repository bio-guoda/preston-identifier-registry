#!/bin/bash
#
# resolve orcids from stdin
#
# example:
#  $ echo "0000-0001-5561-8471" | ./resolve_orcids.sh
#  Kojun Kanda
#

  # resolve names associated with the orcids
awk '{ print "https://orcid.org/" $1 "/person.json" }'\
| xargs -L1 curl --silent\
| jq --raw-output .displayName


