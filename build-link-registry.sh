#!/bin/bash

PATTERN_NAME=${1:-email}

./build-datasets-containing-pattern.sh ${PATTERN_NAME} | uniq | ./build-datasets-matched-values.sh ${PATTERN_NAME} | sort | uniq | gzip
