#!/bin/bash
# Finds lines of text containing likely new species references.
#
# Note: depending on your internet bandwidth, it might take a while to download, and scan through, ~1TB of data. 
#
# Aside from standard *nix tools, this script depends on Preston (https://preston.guoda.bio) and pv (pipe viewer)

set -xe

REMOTES="--remote https://deeplinker.bio,https://archive.org/download/biodiversity-dataset-archives/data.zip/data/"

PATTERN="(^|[^\w])(([Nn] [Ss][Pp])|([Nn]\.[Ss][Pp]\.)|([Nn]\. [Ss][Pp]\.)|([Nn][Ee][Ww] [Ss][Pp][Ee][Cc][Ii][Ee][Ss])|([Nn][Ee][Ww] [Ss][Pp]\.))(\z|[^\w])"

preston history -l tsv $REMOTES\
| tr '\t' '\n'\
| grep "hash://sha"\
| tail -n2\
| head -n1\
| xargs -L1 preston cat --no-cache $REMOTES\
| preston grep --no-cache $REMOTES -l tsv "${PATTERN}"\
| pv -l\
| grep "http://www.w3.org/ns/prov#value"\
| tee new-names.txt



