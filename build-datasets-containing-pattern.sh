#!/bin/bash
#
# build a lookup table with any datasets matching at least one entry of a pattern
#
#
PATTERN_NAME="${1:-email}"

set -xe

PATTERN=$(cat registry.tsv\
 | grep "${PATTERN_NAME}"\
 | cut -f2)

preston ls\
 | preston match -l tsv "${PATTERN}"\
 | grep "http://www.w3.org/ns/prov#value"\
 | cut -f1,3\
 | grep -o -E "(hash:\/\/sha256\/[a-f0-9]{64})"
