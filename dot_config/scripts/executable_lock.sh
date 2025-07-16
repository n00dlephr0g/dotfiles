color="$(cat ~/.cache/wal/colors.json | jq '.["special"]' | jq '.["background"]')"
initcolor="0x${color:2:-1}"
color=$(cat ~/.cache/wal/colors.json | jq '.["colors"]' | jq '.["color4"]')
inputcolor="0x${color:2:-1}"
color=$(cat ~/.cache/wal/colors.json | jq '.["colors"]' | jq '.["color1"]')
failcolor="0x${color:2:-1}"

waylock -init-color $initcolor -input-color $inputcolor -fail-color $failcolor
