#!/bin/awk -f
{
  average = 1;
  for (i = 2; i <= NF; i++) average *= $i;
  average ^= 1 / (NF - 1);
  printf("%s ", $1);
  for (i = 2; i <= NF; i++) printf("%s%s", $i * log($i / average), i == NF ? "\n": " ");
}
