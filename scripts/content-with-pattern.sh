#!/bin/bash
# Creates list of content ids that contain a specific pattern (e.g., a specific content id) in recent biodiversity data.
#
# Note: depending on your internet bandwidth, it might take a while to download, and scan through, ~1TB of data. 
#
# Aside from standard *nix tools, this script depends on Preston (https://preston.guoda.bio) and pv (pipe viewer)

set -xe

REMOTES="--remote https://deeplinker.bio,https://archive.org/download/biodiversity-dataset-archives/data.zip/data/"

PATTERN=${1:-0000-0001-7134-3324}

preston history -l tsv $REMOTES\
| tr '\t' '\n'\
| grep "hash://sha"\
| tail -n2\
| head -n1\
| xargs -L1 preston cat --no-cache $REMOTES\
| preston grep --no-cache $REMOTES -l tsv "$PATTERN"\
| pv -l\
| grep "http://www.w3.org/ns/prov#value"\
| cut -f1\
| grep -o -E "hash://sha256/[a-f0-9]{32}"
