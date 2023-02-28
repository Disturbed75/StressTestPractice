#!/bin/sh

file=results/conc_500.json

rm ${file}
touch ${file}

echo "========== RUNNING CONCURRENCY = 500 =========="
resp=$(siege --content-type="application/json" -j -d1 -t10s -c500 -j -f ./data/urls.txt)
echo "${resp}," >> ${file}

exit 0
