#!/bin/bash

# this is a shell script that will act as a sway config variable
# usage: swayrow.sh <row or column> <+ or -> <int>
# operations: row, column
# 

# set argument variables for readability
rc=$1
operator=$2
amount=$3

# save current row to script
currentws=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true).name')
currentrow="${currentws%%:*}"
currentcol="${currentws#*:}"
savedir="/tmp/sway/swayrows"
mkdir -p $savedir

operate() {
    # usage: plusminus <input 1> <operator> <input 2>
    # operators:
    # "+": adds amount and echoes value
    # "-": subtracts amount and echoes value
    # "set": returns amount
    # this function will not 
    if [[ $2 = "set" ]]; then
        output=$3
    else
        output=$(( $1 $2 $3 ))
    fi
    if [[ $output -le 0 ]]; then
        output=0
    fi
    echo $output
}

if [[ "$rc" == "row" ]]; then
    # set the new row
    newrow=$(operate $currentrow $operator $amount)
    # set the new col (load from save if exists)
    if [[ -f "$savedir/$newrow" ]]; then
        newcol=$(cat "$savedir/$newrow")
    else
        newcol=0
    fi
    # change to new workspace
    swaymsg workspace "$newrow:$newcol"
    echo "workspace $newrow:$newcol"
    # check if the original row still exists after switch and rm if not
    if [[ -z $(swaymsg -t get_workspaces | jq -r '.[].name' | grep "$currentrow:") ]]; then
        rm $savedir/$currentrow
    else
        cat $currentcol > $savedir/$currentrow
    fi
    # done
elif [[ "$rc" == "col" ]]; then
    # set the new col
    newcol="$(operate $currentcol $operator $amount)"
    # change to new workspace
    swaymsg workspace "$currentrow:$newcol"
    echo "$newrow:$newcol"
fi

