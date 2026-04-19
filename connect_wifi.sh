#!/bin/bash

echo "Al parecer quieres cambiar de red..."
printf "Ingresa el SSID: "
read SSID
read -r -s -p "Ingresa la contraseña de $SSID: " PASSWORD
echo ''

echo 'Revisando si ya ha sido agregada antes...'
echo '---------------SUDO-------------------'

if sudo grep -q "ssid=$SSID" /etc/wpa_supplicant/wpa_supplicant.conf; then
	echo 'No se puede continuar ya esta agregada...'
	exit 0
else
	echo 'No existe, agregando...'
fi

wpa_passphrase "$SSID" "$PASSWORD" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
revisar_pipeline=${PIPESTATUS[1]}

if [ $revisar_pipeline -eq 0 ] ; then
	echo 'Red agregada de forma correcta al archivo :>'
else
	echo 'No se agrego correctamente :<'
fi

echo ''
echo '-----------RESETEANDO-SERVICIOS-------------'
sudo sv restart wpa_supplicant
echo 'Esperando que arranque wpa_supplicant'
sleep 10
sudo sv restart dhcpcd