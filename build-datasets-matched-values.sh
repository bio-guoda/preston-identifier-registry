#!/bin/bash
#
# build a lookup table with any datasets matching at least one entry of a pattern
#
#
set -xe

PATTERN_NAME=$(cat datasets-containing-pattern.tsv\
 | head -n1\
 | cut -f1)

PATTERN=$(cat registry.tsv\
 | grep "${PATTERN_NAME}"\
 | cut -f2)

cat datasets-containing-pattern.tsv \
 | cut -f2\
 | sed "s+^+<a> <http://purl.org/pav/hasVersion> <+g" \
 | sed "s+$+> \.+g" \
 | preston match -l tsv "${PATTERN}"\
 | grep "http://www.w3.org/ns/prov#value"\
 | cut -f1,3\
 | sed 's+^.*hash:+hash:+g'\
 | sed 's+!/.*\t+\t+g'\
 | awk -F '\t' '{ print $2 "\t" $1 }' \
 | sort\
 | uniq
