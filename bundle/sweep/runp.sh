#!/bin/bash
# usage: runp.sh p dP W
# (environment line removed for release: gp must be on PATH)
cd sweep
rm -f sweep_p$1.txt
printf 'read("sweep.gp");\nrun(%s,%s,%s);\nquit\n' "$1" "$2" "$3" | gp -q -s 4G > gp_p$1.log 2>&1
echo "done p=$1" >> gp_p$1.log
