#!/bin/bash
if fcitx5-remote | grep -q "2"; then
    echo "Need to send jj over"
    nvr --remote-send '<esc>'
fi
