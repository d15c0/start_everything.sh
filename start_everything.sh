#! /bin/bash

sudo ip link set wlan1 down
sudo ip link set wlan2 down
sudo ip link set wlan3 down
sudo ip link set wlan4 down

sudo iw dev wlan1 set type monitor
sudo iw dev wlan2 set type monitor
sudo iw dev wlan3 set type monitor
sudo iw dev wlan4 set type monitor

sudo ip link set wlan1 up
sudo ip link set wlan2 up
sudo ip link set wlan3 up
sudo ip link set wlan4 up

sudo mv /home/ubuntu/kismet-display/logs/*.kismet /home/ubuntu/kismet-display/logs/backup

cd /home/ubuntu/kismet-display/logs

sudo gnome-terminal --window-with-profile=Bash -e 'sudo kismet -c wlan1 -c wlan2 -c wlan3 -c wlan4 "route -n; read"'

sleep 60

sudo /home/ubuntu/kismet-display/kismet-display -k /home/ubuntu/kismet-display/logs/*.kismet -p -a -u --avg 10 -i 20
