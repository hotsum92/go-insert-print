#!/bin/bash -eu

sed -E -i '/func (\([^\(]+\))? ?[^\(]+\(.*/{p;s/func (\([^\(]+\))? ?([^ \(]+)\(.*/println("DEV:\2")/}' "$@"

for s in $(git grep 'DEV:' "$@"); do
  path=$(echo $s | cut -d: -f1)
  line=$(echo $s | cut -d: -f2)

  echo "sed -i '${line}s/DEV:/$path:$line:/' $path" | bash
done

go fmt "$@" 1> /dev/null
