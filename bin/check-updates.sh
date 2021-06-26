#! /bin/bash

if /usr/sbin/softwareupdate -l 2>&1 |grep "No new software" ; then
    echo "No new software"
else
    reminders add Home Install updates on Cthulhu --due-date "tomorrow 9am"
fi

