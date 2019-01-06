#!/bin/bash

WIFINAME=""
WIFIPW=""
WPAPATH="/etc/wpa_supplicant/wpa_supplicant.conf"

input_wifi_info() 
{
  while [ "$WIFINAME" == "" ]	
	do 
		echo -n "请输入wifi名称："
		read WIFINAME 
  	done

  while [ "$WIFIPW" == "" ]
	 do 
		echo -n "请输入wifi密码："
		read WIFIPW 
  	done
}

add_wifi_info() 
{
	line1="network={"
	line2="    ssid=\"$WIFINAME\""
	line3="    psk=\"$WIFIPW\""
	line4="}"
	sudo echo $line1 >> $WPAPATH 
	sudo echo $line2 >> $WPAPATH 
  sudo echo $line3 >> $WPAPATH 
	sudo echo $line4 >> $WPAPATH 
}

check_wifi_connect()
{
	RESULT=$(iwgetid)
	if [ "$RESULT" == "" ]
	then
		echo "wifi连接失败，请重新运行脚本"
	else
		echo "wifi连接成功"
	fi
}

input_wifi_info
add_wifi_info
wpa_cli -i wlan0 reconfigure
check_wifi_connect

