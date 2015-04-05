#!/bin/bash

files="$(ls ../data/hosts.*)"

# go
for file in $files ; do
    name="$(basename $file | cut -f2 -d.)"
    ln -svf bs-proxy.sh go.$name
done

# bs
for file in $files ; do
    name="$(basename $file | cut -f2 -d.)"
    ln -svf bs-proxy.sh bs.$name
done
