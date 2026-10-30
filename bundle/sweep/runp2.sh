#!/bin/bash
# usage: runp2.sh p dP W   (4-hour cap)
# (environment line removed for release: gp must be on PATH)
cd sweep
rm -f sweep_p$1.txt
printf 'read("sweep.gp");\nrun(%s,%s,%s);\nquit\n' "$1" "$2" "$3" | timeout 14400 gp -q -s 5G > gp_p$1.log 2>&1
echo "exit $? p=$1" >> gp_p$1.log
