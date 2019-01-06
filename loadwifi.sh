sudo echo wifi-info.txt >> /etc/wpa_supplicant/wpa_supplicant.conf
wpa_cli -i wlan0 reconfigure
echo "装载wifi成功，请输入iwgetid查看wifi是否已经连接"