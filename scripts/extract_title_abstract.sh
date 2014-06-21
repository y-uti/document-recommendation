#!/bin/bash

BASEDIR=$(cd $(dirname $0)/.. && pwd)
DATADIR=$BASEDIR/data
SCRIPTDIR=$BASEDIR/scripts

INPUT=${1:-$DATADIR/jawiki-latest-abstract.xml}
TITLE=${2:-$DATADIR/title.txt}
ABSTRACT=${3:-$DATADIR/abstract.txt}


tmpfile=$(mktemp)
grep -B2 '^<abstract>' $INPUT | grep '^<[ta]' >$tmpfile
grep '^<t' $tmpfile | cut -f2- -d' ' | sed 's,<[^>]*>$,,' >$TITLE
grep '^<a' $tmpfile | sed 's/^<[^>]*>//' | sed 's/<[^>]*>$//' >$ABSTRACT

rm -f $tmpfile
