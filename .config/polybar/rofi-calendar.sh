#! /bin/sh

DATEFTM="${DATEFTM:-+%a. %d. %b. %Y}"
SHORTFMT="${SHORTFMT:-+%d.%m.%Y}"
LABEL="${LABEL:-}"
blockdate=$(date "$DATEFTM")
shortblockdate=$(date "$SHORTFMT")

year=$(date '+%Y')
month=$(date '+%m')
date=$(cal $month $year | sed -n '1s/^  *//;1s/  *$//p')
cal --monday --color=always $month $year \
    | sed 's/\x1b\[[7;]*m/\<b\>\<u\>/g' \
    | sed 's/\x1b\[[27;]*m/\<\/u\>\<\/b\>/g' \
    | tail -n +2 \
    | rofi \
        -dmenu \
        -markup-rows \
        -no-fullscreen \
        -font "Inconsolata Nerd Font Mono 11" \
        -hide-scrollbar \
        -m -5 \
        -theme-str '#window {anchor:northeast; location: northeast; x-offset: -8px; y-offset: 28px;} entry { placeholder: "";}' \
        -eh 1 \
        -bw 0 \
        -width -24 \
        -lines 6 \
        -no-custom \
        -p "$date" > /dev/null 
echo "$LABEL$blockdate"
echo "$LABEL$shortblockdate"
