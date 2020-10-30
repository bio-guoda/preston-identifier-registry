#!/bin/bash
#
# build a lookup table with any datasets matching at least one entry of a pattern
#
#
PATTERN_NAME="${1:-email}"

set -xe

cat datasets-containing-pattern.tsv \
 | cut -f2\
 | sed "s+^+<a> <http://purl.org/pav/hasVersion> <+g" \
 | sed "s+$+> \.+g" \
 | preston match -l tsv "[a-zA-Z0-9_.+-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,6}"\
 | grep "http://www.w3.org/ns/prov#value"\
 | cut -f1,3\
 | sed 's+^.*hash:+hash:+g'\
 | sed 's+!/.*\t+\t+g'\
 | awk -F '\t' '{ print $2 "\t" $1 }' \
 | sort\
 | uniq
