#!/bin/bash

#   Author 
#   Dansecret
#
echo "install VNC RSCUAD"

#UPDATE APT AND UPGRADE
sudo apt update && sudo apt upgrade -y
sudo apt-get install lightdm

sudo reboot

# install vnc 
sudo apt-get install x11vnc

#Edit GNU
#check your file 
sudo nano /lib/systemd/system/x11vnc.service

#copy and paste


#[Unit]
#Description=x11vnc service
#After=display-manager.service network.target syslog.target

#[Service]
#Type=simple
#ExecStart=/usr/bin/x11vnc -forever -display :0 -auth guess -passwd rscuad
#ExecStop=/usr/bin/killall x11vnc
#Restart=on-failure

#[Install]
#WantedBy=multi-user.target

#DELETE ALL "#"

systemctl daemon-reload
systemctl enable x11vnc.service
systemctl start x11vnc.service
systemctl status x11vnc.service

x11vnc status
sudo reboot

# if you change password write in terminal = x11vnc -storepasswd
# password written to: /home/rscuad/.vnc/passwd