#!/bin/sh

dbus-monitor --session "interface='org.freedesktop.Notifications',member='Notify'" |
while read -r line; do
    echo "$line" | grep -q 'member=Notify' || continue

    # leer exactamente las 5 líneas siguientes
    read -r app
    read -r replaces
    read -r icon
    read -r summary
    read -r body

    summary=$(printf "%s\n" "$summary" | sed 's/.*string "\(.*\)".*/\1/')

    # DEBUG opcional
    echo "NOTI: $summary"

    mpv --no-video --really-quiet ~/.scripts/sound/error.mp3 &
done
