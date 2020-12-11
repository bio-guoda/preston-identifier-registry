#!/bin/bash
#
# ./create-topic [topic name]
#
# e.g., sudo -u kafka ./create-topic myfirstoptic
#

TOPIC_NAME=$1

/var/lib/kafka/kafka-current/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic "$TOPIC_NAME" --config cleanup.policy=compact --config delete.retention.ms=100 --config segment.ms=100 --config min.cleanable.dirty.ratio=0.01
