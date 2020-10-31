#!/bin/bash
#
# reads from stdin to p
#
#
set -xe

PATTERN_NAME=${1:-email}

PATTERN=$(cat registry.tsv\
 | grep "${PATTERN_NAME}"\
 | cut -f2)

cat\
 | cut -f2\
 | sed "s+^+<a> <http://purl.org/pav/hasVersion> <+g" \
 | sed "s+$+> \.+g" \
 | preston match -l tsv "${PATTERN}"\
 | grep "http://www.w3.org/ns/prov#value"\
 | cut -f1,3\
 | sed 's+^.*hash:+hash:+g'\
 | sed 's+!/.*\t+\t+g'\
 | awk -F '\t' '{ print $2 $1 "|" $2 "\t" $1 }'
