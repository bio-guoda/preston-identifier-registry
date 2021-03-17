#!/bin/bash
#
# Count the number of times a identifier scheme is used in a 3-hash . A 3-hash bin groups all content with same first three sha256 characters. 
#
# usage:
#  ./count-identifier-scheme-usage.sh [identifier scheme]
#
# example counting usage of ARK identifiers:
#  ./count-identifier-scheme-usage ark
#

./consume-link-registry.sh meise | pv -l | grep -o -E "hash://sha256/[a-f0-9]+" | sed 's/sha256//g' | sort | uniq | grep -o -E "[a-f0-9]{3}" | sort | uniq -c | sort -nr | sed -E 's/^[ ]+//g' | awk -F ' ' '{ print $2 "\t" $1 }' | sort

