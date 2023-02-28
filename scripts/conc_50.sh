#!/bin/sh

file=results/conc_50.json

rm ${file}
touch ${file}

echo "========== RUNNING CONCURRENCY = 50 =========="
resp=$(siege --content-type="application/json" -j -d1 -t10s -c50 -j -f ./data/urls.txt)
echo "${resp}," >> ${file}

exit 0
