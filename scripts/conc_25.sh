#!/bin/sh

file=results/conc_25.json

rm ${file}
touch ${file}

echo "========== RUNNING CONCURRENCY = 25 =========="
resp=$(siege --content-type="application/json" -j -d1 -t10s -c25 -j -f ./data/urls.txt)
echo "${resp}," >> ${file}

exit 0
