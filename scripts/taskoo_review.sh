#!/bin/bash

# Infinite loop to allow multiple tasks
while true; do
    # Step 1: Select a process from the list
    task=$(tt list c:Inbox | sed 's/\x1b\[[0-9;]*m//g' | rofi -font "monospace 16" -dmenu -width 200ch -p "today")

    # If no process is selected, break the loop
    if [ -z "$task" ]; then
        break
    fi

    # Extract the PID from the selected process
    pid=$(echo $process | awk '{print $1}')

    # Step 2: Choose an action for the selected process
    action=$(echo -e "Kill\nInfo\nContinue" | rofi -dmenu -p "Action")

    # Step 3: Perform the action based on the selection
    # case $action in
    #     "Kill")
    #         kill $pid
    #         rofi -e "Process $pid killed"
    #         ;;
    #     "Info")
    #         rofi -e "$(ps -p $pid -o pid,comm,%mem,%cpu)"
    #         ;;
    #     "Continue")
    #         ;;
    #     *)
    #         break  # Exit if no valid action is selected
    #         ;;
    # esac
done
