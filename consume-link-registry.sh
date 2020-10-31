#!/bin/bash
#
# Reads from link registry
#
# Usage:
#   ./consume-link-registry.sh [pattern name]
#
# Prerequisites: a running kafka broker and a kafka topic (see https://github.com/bio-guoda/preston-scripts/tree/main/server)

PATTERN_NAME=${1:-email}

kafkacat -b localhost:9092 -t ${PATTERN_NAME} -K '|'
