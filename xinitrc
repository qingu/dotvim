#!/bin/sh

sleep 10s 

xsetroot -solid black &
#启动屏保程序
gnome-screensaver &
#启用gnome的主题，否则你的awesome下的gnome程序会非常难看
gnome-settings-daemon &    
#电源管理程序
gnome-power-manager &      
#网络管理程序
nm-applet &                           
#自动更新程序
update-notifier &      
#fcitx
fcitx -d &
#
/usr/bin/python ~/.nutstore/dist/bin/nutstore-pydaemon.py >/dev/null 2>&1 &
#goagent
/usr/bin/python /home/metman/bin/goagent/local/proxy.py >/dev/null 2>&1 &

synapse &

while true;
do
	awsetbg -r ~/wallpaper
	sleep 30m
done &

exec awesome 
