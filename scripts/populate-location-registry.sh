#!/bin/bash
#
# Populates content locations  
# into a kafka topic location 
#
# Usage: 
#   ./populate-location-registry.sh
#
# Prerequisites: a running kafka broker and a kafka topic (see https://github.com/bio-guoda/preston-scripts/tree/main/server) .
#

set -xe

date
time preston ls | grep -E "hasVersion" | awk -F ' ' '{ print $1 "-" $3 "|" $1 " " $2 " " $3 " ." }' | kafkacat -P -b localhost:9092 -t location -K '|'
date
