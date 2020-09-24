#!/bin/bash

# prepare X11
rm -rf /etc/X11/xorg.conf.d/40-libinput.conf
mkdir -p /etc/X11/xorg.conf.d
#cp -rf ./99-fbturbo.conf-HDMI  /etc/X11/xorg.conf.d/99-fbturbo.conf
cp -rf ./99-calibration.conf-3508-0  /etc/X11/xorg.conf.d/99-calibration.conf
sudo cp ./inittab /etc/
# load module on boot
cp ./waveshare35b-v2.dtbo /boot/overlays/
sudo echo "hdmi_force_edid_audio=1" >> /boot/config.txt
sudo echo "dtparam=i2c_arm=on" >> /boot/config.txt
sudo echo "dtparam=spi=on" >> /boot/config.txt
sudo echo "enable_uart=1" >> /boot/config.txt
sudo echo "display_rotate=0" >> /boot/config.txt
sudo echo "max_usb_current=1" >> /boot/config.txt
sudo echo "config_hdmi_boost=7" >> /boot/config.txt
sudo echo "hdmi_group=2" >> /boot/config.txt
sudo echo "hdmi_mode=1" >> /boot/config.txt
sudo echo "hdmi_mode=87" >> /boot/config.txt
sudo echo "hdmi_drive=2" >> /boot/config.txt
sudo echo "hdmi_cvt 480 320 60 6 0 0 0" >> /boot/config.txt
sudo echo "dtoverlay=ads7846,cs=1,penirq=25,penirq_pull=2,speed=50000,keep_vref_on=0,swapxy=0,pmax=255,xohms=150,xmin=200,xmax=3900,ymin=200,ymax=3900" >> /boot/config.txt
sudo echo "hdmi_timings=600 0 20 28 48 400 0 13 3 32 0 0 0 30 0 25000000 5" >> /boot/config.txt
sudo echo "dtoverlay=waveshare35b-v2">> /boot/config.txt

cp ./cmdline.txt /boot/

# touch screen calibration
apt-get install xserver-xorg-input-evdev
cp -rf /usr/share/X11/xorg.conf.d/10-evdev.conf /usr/share/X11/xorg.conf.d/45-evdev.conf

# done :)
echo "reboot now"
reboot
