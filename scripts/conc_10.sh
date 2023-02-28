#!/bin/sh

file=results/conc_10.json

rm ${file}
touch ${file}

echo "========== RUNNING CONCURRENCY = 10 =========="
resp=$(siege --content-type="application/json" -j -d1 -t10s -c10 -j -f ./data/urls.txt)
echo "${resp}," >> ${file}

exit 0
