#!/bin/bash

file=blacklist.conf

sed -i '' -e '/gfwlist/,/^$/{/^DOMAIN-SUFFIX/d;}' ${file}

curl https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/gfw.txt | sed 's/^/DOMAIN-SUFFIX,/g' | sed 's/$/,PROXY/g' > gfwlist.txt
curl https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/greatfire.txt | sed 's/^/DOMAIN-SUFFIX,/g' | sed 's/$/,PROXY/g' > greatfire.txt

cat gfwlist.txt greatfire.txt | sort | uniq > temp.txt

sed -i '' -e '/gfwlist/ r temp.txt' ${file}
