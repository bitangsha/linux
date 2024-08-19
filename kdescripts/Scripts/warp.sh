#!/bin/bash
keyword="Disconnected"
show_notification()
{
     /usr/bin/notify-send --icon=dialog-information -t 4000 "$1" >/dev/null 2>&1
}
toggle_connection() {
    status=$(warp-cli status)
    #echo $status
    if [[ $status == *"$keyword"* ]]; then
        echo "Was Disconnected"
        warp-cli connect
        show_notification "WARP Activated"
    else
        echo "Was Connected"
        warp-cli disconnect
        show_notification "WARP Deactivated"
    fi
}
toggle_connection
