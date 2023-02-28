#!/bin/sh

file=results/result.json
csv_file=results/result.csv

conc_10=results/conc_10.json

rm ${file}
rm ${csv_file}

touch ${file}
touch ${csv_file}

echo "[" >> ${file}

cat results/conc_10.json >> ${file}
cat results/conc_25.json >> ${file}
cat results/conc_50.json >> ${file}
cat results/conc_100.json >> ${file}
cat results/conc_500.json >> ${file}
cat results/conc_700.json >> ${file}

echo "]" >> ${file}

csv_content=$(dasel -r json -w csv < ${file})
echo "${csv_content}" >> ${csv_file}

rm ${file}
