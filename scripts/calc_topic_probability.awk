#!/bin/awk -f
{
  total = NF * alpha;
  for (i = 1; i <= NF; i++) total += $i;
  for (i = 1; i <= NF; i++) printf("%f%s", ($i + alpha) / total, i == NF ? "\n" : " ");
}
