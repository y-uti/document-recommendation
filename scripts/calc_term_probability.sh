#!/bin/bash

model=$1
beta=$2

(
  cat $model | awk -vbeta=$beta '{
    for (i = 2; i <= NF; i++) sum[i - 2] += $i;
  }
  END {
    for (i = 0; i <= NF - 2; i++) printf("%s%s", sum[i] + beta * NR, i == NF - 2 ? "\n" : " ");
  }'
  cat $model
) | awk -vbeta=$2 '
(NR == 1) {
  for (i = 1; i <= NF; i++) total[i - 1] = $i;
}
(NR > 1) {
  printf("%s ", $1);
  for (i = 2; i <= NF; i++) printf("%s%s", ($i + beta) / total[i - 2], i == NF ? "\n" : " ");
}'
