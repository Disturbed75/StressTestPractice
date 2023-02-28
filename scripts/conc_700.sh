#!/bin/sh

file=results/conc_700.json

rm ${file}
touch ${file}

echo "========== RUNNING CONCURRENCY = 700 =========="
resp=$(siege --content-type="application/json" -j -d1 -t10s -c700 -j -f ./data/urls.txt)
echo "${resp}" >> ${file}

exit 0
