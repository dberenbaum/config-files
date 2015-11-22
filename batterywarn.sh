#!/bin/bash

export DISPLAY=:0

REM_TIME=$(acpi -b | grep "Discharging" | cut -f 5 -d " ")

if [[ ${REM_TIME} != '' && ${REM_TIME} < 00:20:00 ]]; then

    /usr/bin/i3-nagbar -m "Battery Low: ${REM_TIME} remaining!"

fi
