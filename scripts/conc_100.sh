#!/bin/sh

file=results/conc_100.json

rm ${file}
touch ${file}

echo "========== RUNNING CONCURRENCY = 100 =========="
resp=$(siege --content-type="application/json" -j -d1 -t10s -c100 -j -f ./data/urls.txt)
echo "${resp}," >> ${file}

exit 0
