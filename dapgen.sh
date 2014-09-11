#!/bin/bash
version=`grep version: meta.yaml | cut -f2 -d' '`
dir=openscad-$version

mkdir $dir
cp -r {a,doc,f,i,m}* $dir

tar czvf $dir.dap $dir/

rm -rf $dir/
