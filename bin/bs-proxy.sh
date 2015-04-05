#!/bin/bash

here="$(dirname $0)"
name="$(basename $0)"
action="$(echo $name | cut -f1 -d.)"
host="$(echo $name | cut -f2 -d.)"
hostfile=$here/../data/hosts.$host

if [ "$action" = "go" ] ; then
    where="$1"
    echo "now go to '$where' with $hostfile"
    eval $(grep -v '^#' "$hostfile" | grep $where | head -n1 | awk -F'\t' '{printf("ip=%s;port=%s;user=%s;pass=%s",$2,$3,$4,$5)}')
    cmd="$(grep -v '^#' "$hostfile" | grep $where | head -n1 | awk -F'\t' '{print $6}')"
    if [ -z "$ip" ] ; then
        echo "host '$where' not found."
    else
        $here/bs-go.sh $ip $port $user $pass "$cmd"
    fi
fi

if [ "$action" = "bs" ] ; then
    echo "bs with $hostfile"
    $here/bs $hostfile
fi
