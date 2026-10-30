#!/bin/bash
# 30-minute watcher for the two sweep lanes: alert if fewer than 2 engines or WSL available memory < 2500 MB
cd /d/_LIVE/NEXT-2026-10-27/ramanujan/deg11/sweep
for i in $(seq 1 60); do
  sleep 30
  out=$(MSYS_NO_PATHCONV=1 wsl -e bash -lc 'ps -eo pid,etime,rss,args | grep "[g]p -q -s 5G" | grep -v timeout; free -m | sed -n 2p' 2>&1)
  n=$(echo "$out" | grep -c "gp -q")
  mem=$(echo "$out" | awk '/Mem:/{print $7}')
  if [ "$n" -lt 2 ] || { [ -n "$mem" ] && [ "$mem" -lt 2500 ]; }; then
    echo "ALERT at check $i: engines=$n availMB=$mem"; echo "$out"; exit 0
  fi
done
echo "30-min watch OK"; echo "$out"
for f in gal_p*.log; do echo "== $f"; tail -c 200 "$f"; done
