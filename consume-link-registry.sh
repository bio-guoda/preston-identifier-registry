#!/bin/bash
#
# Consumes/reads all message from link registry and quit.
#
# Usage:
#   ./consume-link-registry.sh [pattern name]
#
# Prerequisites: a running kafka broker and a kafka topic (see https://github.com/bio-guoda/preston-scripts/tree/main/server)

PATTERN_NAME=${1:-email}

kafkacat -C -e -b localhost:9092 -t ${PATTERN_NAME}

# Note that the messages are likely keyed to enable compaction (aka key de-duplication) 
# if you'd like to see the keys printed along with the message, you can use something like
# kafkacat -b localhost:9092 -t ${PATTERN_NAME} -f 'Topic %t [%p] at offset %o: key [%k]: message: [%s]\n'
