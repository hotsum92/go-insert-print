#!/bin/bash -eu

#grep -E 'func (\([^\(]+\))? ?[^\(]+\(' main.go

sed -E '/func (\([^\(]+\))? ?[^\(]+\(.*/{p;s/func (\([^\(]+\))? ?([^ \(]+)\(.*/println("DEV:\2")/}' main.go > main.go.tmp

sed -E '/DEV:/' main.go > main.go.tmp

awk '/DEV:/ {print FILENAME ":" FNR ":" $0}' ./main.go.tmp
awk '{print FILENAME ":" FNR ":" $0}' main.go

sed '6s/DEV:/TEST:/' ./main.go.tmp

for s in $(git grep 'DEV:' ./main.go.tmp); do
  path=$(echo $s | cut -d: -f1)
  line=$(echo $s | cut -d: -f2)

  echo "sed -i '${line}s/DEV:/$path:$line:/' $path" | bash
done
