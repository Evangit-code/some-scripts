#!/bin/sh

echo "Script ejecutado $(date)" > /tmp/battery_debug

while [ true ] ; do
	sh ~/.scripts/battery_state.sh
	echo "Waiting..." > ~/.loop_state
	sleep 120
	echo "Checking..." > ~/.loop_state
done
