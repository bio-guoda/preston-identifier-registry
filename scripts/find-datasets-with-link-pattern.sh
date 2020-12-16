#!/bin/bash
#
# print all titles of dataset containing
# arctos specimen ids
#
# Prerequisites: kafkacat, xmllint, socat, preston etc.
#
#

PATTERN_NAME=${1:-arctos}

kafkacat -e -b http://localhost:9092 -t ${PATTERN_NAME}\
 | cut -f2\
 | uniq\
 | awk -v quote="'" '{ print "https://preston.guoda.bio/cat/zip:" $1 "!/eml.xml"  }'
 
