#!/bin/sh

# Generate stats from the log produced by static-analysis.nix, such that we
# can report the result, and also such that we can report the delat on each
# modifications.

output() {

    local alias=$1;
    local unpatched=$2;
    local recompile=$3;
    echo "($alias alias, $unpatched unpatched, $recompile recompile)"
}

total() {
    local alias=$1;
    local unpatched=$2;
    local recompile=$3;
    output "$alias" "$unpatched" "$recompile"
}

delta() {
    local alias=$1;
    local unpatched=$2;
    local recompile=$3;
    if test "$alias" -ge 0; then alias="+$alias"; fi
    if test "$unpatched" -ge 0; then unpatched="+$unpatched"; fi
    if test "$recompile" -ge 0; then recompile="+$recompile"; fi
    output "$alias" "$unpatched" "$recompile"
}

if test $# == 1; then
    total $(grep -c ' error: alias' $1) \
          $(grep -c ' error: unpatched' $1) \
          $(grep -c ' warning:' $1)
elif test $# == 2; then
    delta "$(( $(grep -c ' error: alias' $2) - $(grep -c ' error: alias' $1) ))" \
          "$(( $(grep -c ' error: unpatched' $2) - $(grep -c ' error: unpatched' $1) ))" \
          "$(( $(grep -c ' warning:' $2) - $(grep -c ' warning:' $1) ))"
else
    echo 1>&2 "Usage: $0 stat.log [new-stat.log]

Output a summary of the static analysis which can be embedded in commit
messages.
"
fi
