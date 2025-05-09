#!/bin/bash

# this is a shell script that will act as a sway config variable
# usage: swayrow.sh <change or move> <row or column> <+ or - or set> <int>
# operations: row, column

changemove=$1
rowcol=$2
incdecset=$3
amount=$4


plusminus() {
    # usage: plusminus <input 1> <operator> <input 2>
    if [[ $2 = "set" ]]; then
        output=$3
    else
        output="$(( $1 $2 $3 ))"
    fi
    if [[ $output -lt 0 ]]; then
        output=0
    fi
    echo $output
}

changelogic() {
    # set argument variables for readability
    rc=$1
    operator=$2
    number=$3

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
        if ! swaymsg -t get_workspaces | jq -r '.[].name' | grep -q "$oldrow:"; then
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

newws="$(changelogic $rowcol $incdecset $amount)"

if [[ $changemove = "change" ]]; then
    swaymsg workspace $newws
elif [[ $changemove = "move" ]]; then
    swaymsg move container to workspace $newws, workspace $newws
fi
