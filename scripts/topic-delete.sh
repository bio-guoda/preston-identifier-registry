#!/bin/bash
#
# ./delete-topic [topic name]
#
# e.g., sudo -u kafka ./create-topic myfirstoptic
#

TOPIC_NAME=$1

/var/lib/kafka/kafka-current/bin/kafka-topics.sh --delete --zookeeper localhost:2181 --topic "$TOPIC_NAME"
