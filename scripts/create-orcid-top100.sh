#!/bin/bash
# Creates top 100 of most frequently cited in biodiversity data
#
# Note: depending on your internet bandwidth, it might take a while to download, and scan through, ~1TB of data. 
#

preston ls --no-cache --remote https://deeplinker.bio,https://archive.org/download/biodiversity-dataset-archives/data.zip/data/\
| pv -l\
| preston grep --no-cache -l tsv "0000-00[0-9]{2}-[0-9]{4}-[0-9]{4}"\
| grep "http://www.w3.org/ns/prov#value"\
| cut -f3\
| sort\
| uniq -c\
| sort -nr\
| head -n100\
| tee orcid-top100.txt






