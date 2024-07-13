#!/bin/bash -eu

#grep -E 'func (\([^\(]+\))? ?[^\(]+\(' main.go

sed -E '/func (\([^\(]+\))? ?[^\(]+\(.*/{p;s/func (\([^\(]+\))? ?([^ \(]+)\(.*/println("\2")/}' main.go
