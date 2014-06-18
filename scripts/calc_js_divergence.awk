#!/usr/bin/awk -f

(NR == 1) {
  for (i = 1; i <= NF; i++) base[i - 1] = $i;
}
(NR > 1) {
  distance = 0;
  for (i = 1; i <= NF; i++) {
    r = $i + base[i - 1];
    distance += $i * log(2 * $i / r) + base[i - 1] * log(2 * base[i - 1] / r);
  }
  print distance / 2;
}
