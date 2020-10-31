#!/bin/bash

PATTERN_NAME=${1:-email}

./build-datasets-containing-pattern.sh ${PATTERN_NAME} | ./build-datasets-matched-values.sh ${PATTERN_NAME} | kafkacat -b localhost:9092 -t ${PATTERN_NAME} -K '|'
