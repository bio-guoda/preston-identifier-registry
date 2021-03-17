#!/bin/bash
# Creates top 100 of most frequently cited in biodiversity data
#
# Note: depending on your internet bandwidth, it might take a while to download, and scan through, ~1TB of data. 
#
# Aside from standard *nix tools, this script depends on Preston (https://preston.guoda.bio) and pv (pipe viewer)

preston ls --no-cache --remote https://deeplinker.bio,https://archive.org/download/biodiversity-dataset-archives/data.zip/data/\
| preston grep --no-cache -l tsv "0000-00[0-9]{2}-[0-9]{4}-[0-9]{4}"\
| pv -l\
| grep "http://www.w3.org/ns/prov#value"\
| cut -f3\
| sort\
| uniq -c\
| sort -nr\
| head -n100\
| tee orcid-top100.txt

# resolve names associated with the orcids
paste <(cat orcid-top100.txt) <(cat orcid-top100.txt | sed -E 's/^[ ]+//g' | tr ' ' '\t' | cut -f2 | awk '{ print "https://orcid.org/" $1 "/person.json" }' | xargs -L1 --silent curl | jq --raw-output .displayName) | tee orcid-top100-with-names.txt




