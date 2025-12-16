choise=$(echo -e "poweroff\nreboot\ncancel" | dmenu -l 20 -c -p 'Que vas a hacer?' -fn "JetBrainsMono Nerd Font-12")

if [ $choise = 'poweroff' ]; then
	sudo poweroff
elif [ $choise = 'reboot' ]; then
	sudo reboot
else
	exit 0
fi
