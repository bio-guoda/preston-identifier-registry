#!/bin/bash
#
# Populates pattern matched values and datasets content-id 
# into a kafka topic [pattern name] 
#
# Usage: 
#   ./populate-pattern-registry.sh [pattern name]
#
# Prerequisites: a running kafka broker and a kafka topic (see https://github.com/bio-guoda/preston-scripts/tree/main/server) .
#

set -xe

PATTERN_NAME=${1:-email}
date
time ./build-datasets-matched-values.sh ${PATTERN_NAME} | kafkacat -P -b localhost:9092 -t ${PATTERN_NAME} -K '|'
date
