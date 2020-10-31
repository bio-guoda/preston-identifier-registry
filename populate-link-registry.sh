#!/bin/bash

PATTERN_NAME=${1:-email}
date
time ./build-datasets-matched-values.sh ${PATTERN_NAME} | kafkacat -b localhost:9092 -t ${PATTERN_NAME} -K '|'
date
