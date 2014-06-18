#!/bin/bash

BASEDIR=$(cd $(dirname $0)/.. && pwd)
DATADIR=$BASEDIR/data
SCRIPTDIR=$BASEDIR/scripts

TITLE=${1:-$DATADIR/title.txt}
ABSTRACT=${2:-$DATADIR/abstract.txt}
SIZE=${3:-5000}
MIN_LENGTH=${4:-100}
TITLE_OUT=${5:-${TITLE%.txt}-$SIZE.txt}
ABSTRACT_OUT=${6:-${ABSTRACT%.txt}-$SIZE.txt}


tmpfile1=$(mktemp)
awk -v min_length=$MIN_LENGTH '{
  print length($0) < min_length ? 0 : 1;
}' $ABSTRACT >$tmpfile1

step=$(($(grep ^1 $tmpfile1 | wc -l | cut -f1 -d' ') / $SIZE))
if [ $step -eq 0 ]; then
  step=1
fi

tmpfile2=$(mktemp)
awk -v step=$step '{
  print ($1 && (++lines % step == 0)) ? 1 : 0;
}' $tmpfile1 >$tmpfile2

paste $tmpfile2 $TITLE | grep ^1 | head -n $SIZE | cut -f2- >$TITLE_OUT
paste $tmpfile2 $ABSTRACT | grep ^1 | head -n $SIZE | cut -f2- >$ABSTRACT_OUT

rm -f $tmpfile1 $tmpfile2
