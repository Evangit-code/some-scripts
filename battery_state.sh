#!/bin/sh

porcentaje_bat=$(cat /sys/class/power_supply/BAT1/capacity)
ac_check=$(cat /sys/class/power_supply/ACAD/online)

if [ "$porcentaje_bat" -le 30 ] && [ "$ac_check" -eq 0 ]; then
	dunstify "Bateria Baja" "Porfavor conectar ($porcentaje_bat%)"
elif [ "$porcentaje_bat" -ge 90 ] && [ "$ac_check" -eq 1 ]; then
	dunstify "La Bateria esta a cargada" "Porfavor desconectar el cargador ($porcentaje_bat%)"
fi
