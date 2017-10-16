#/bin/bash

FILE="/sys/class/backlight/acpi_video0/brightness"
CURR=$(cat $FILE)

if [ $# -eq 1 ]; then
    echo $(expr $CURR $1 10) > $FILE
fi
UPD=$(cat $FILE)
printf %$(expr ${UPD} / 20 )s%$(expr 5 - ${UPD} / 20)s | sed 's/ /─/g'
