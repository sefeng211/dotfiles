#!/bin/bash

input=$(rofi -font "monospace 30" -dmenu -p "Input")  # Capture input from rofi

if [ -n "$input" ]; then
    tt add "$input"  # Pass the input to your binary
else
    echo "No input provided"
fi
