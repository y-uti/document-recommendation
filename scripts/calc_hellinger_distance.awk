#!/bin/awk -f

(NR == 1) {
  for (i = 1; i <= NF; i++) base[i - 1] = $i;
}
(NR > 1) {
  distance = 0;
  for (i = 1; i <= NF; i++) distance += ($i^(1/2) - base[i - 1]^(1/2))^2;
  print distance;
}
