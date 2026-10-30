#!/bin/bash
# usage: rung.sh p dP W   (Galois transport, 4-hour cap)
# (environment line removed for release: gp must be on PATH)
cd sweep
rm -f galois_p$1.txt
printf 'read("sweep.gp");\nread("galois.gp");\ngrun(%s,%s,%s);\nquit\n' "$1" "$2" "$3" | timeout 14400 gp -q -s 5G > gal_p$1.log 2>&1
echo "exit $? p=$1" >> gal_p$1.log
