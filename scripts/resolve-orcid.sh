#!/bin/bash
#
# resolve orcids from stdin
#


resolve_orcids() {
  # resolve names associated with the orcids
  sed -E 's/^[ ]+//g'\
  | tr ' ' '\t'\
  | cut -f2\
  | awk '{ print "https://orcid.org/" $1 "/person.json" }'\
  | xargs -L1 curl --silent\
  | jq --raw-output .displayName
}

resolve_orcids

