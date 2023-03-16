#!/bin/bash
if fcitx5-remote | grep -q "2"; then
    # echo "Need to send jj over"
    # nvr --remote-send '<esc>'
    for i in $(nvr --serverlist); do
        nvr --remote-silent --remote-send '<esc>' --servername $i --nostart
        echo "$i"
    done
fi
