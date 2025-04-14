#!/bin/bash

# this is a shell script that will act as a sway config variable
# usage: swayrow.sh <> <row or column> <+ or -> <int>
# operations: row, column
# 


plusminus() {
    # usage: plusminus <input 1> <operator> <input 2>
    if [[ $2 = "+" ]]; then
        output="$(($1 + $3))"
    elif [[ $2 = "-" ]]; then
    output="$(($1 - $3))"
        if [[ $output -le 0 ]]; then
            echo 0
            return 0
        fi
    fi

    echo $output
}

changelogic() {
    # set argument variables for readability
    rc=$1
    operator=$2
    amount=$3

    # save current row to script
    oldws=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true).name')
    oldrow="${oldws%%:*}"
    oldcol="${oldws#*:}"
    savedir="/tmp/sway/swayrows"
    mkdir -p $savedir

    if [[ "$rc" == "row" ]]; then
        # set the new row
        newrow=$(plusminus $oldrow $operator $amount)
        # set the new col (load from save if exists)
        if [[ -f "$savedir/$newrow" ]]; then
            newcol=$(cat "$savedir/$newrow")
        else
            newcol=0
        fi
        # save the old column into cache
        echo "$oldcol" > "$savedir/$oldrow"
        # return new workspace
        echo "$newrow:$newcol"
        # check if the original row still exists after switch and rm if not
        if [[ -z $(swaymsg -t get_workspaces | jq -r '.[].name' | grep "$oldrow:") ]]; then
            rm "$savedir/$oldrow"
        fi
        # done
    elif [[ "$rc" == "col" ]]; then
        # set the new col
        newcol="$(plusminus $oldcol $operator $amount)"
        # return new workspace
        echo "$oldrow:$newcol"
    fi
}

swaymsg workspace "$(changelogic $1 $2 $3)"


