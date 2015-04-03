

# Load image onto SD card

http://beagleboard.org/latest-images

download and extract

run:
    
    diskutil list

insert flash media (sd card)

run again

    diskutil list

determine which /dev/diskN is the sd card

execute:

    sudo dd if=/path/to/downloaded.img of /dev/rdiskN bs=1m

wait. loading image onto SD card.

    diskutil eject /dev/disk3

# Dependencies

# Get driver
    lsusb -t


# /etc/hostapd/hostapd.conf

    interface=wlan0
    driver=rt2870
    bridge=br0

    country_code=FR
    ieee80211d=1

    ssid=MILESBEAGLE

    hw_mode=g

    channel=6

    wme_enabled=0
    macaddr_acl=0
    auth_algs=1

    wpa=2

    wpa_passphrase=mypass123456

    wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP


http://ubuntuforums.org/showthread.php?t=960642


http://www.cyberciti.biz/tips/linux-install-rt2870-chipset-based-usb-wireless-adapter.html

http://www.mediatek.com/en/downloads/usb/

LINUX_SRC = /lib/modules/$(shell uname -r)/build¬
121 # Linux 2.4 Change to your local setting¬
122 #LINUX_SRC = /usr/src/linux-2.4¬
123 LINUX_SRC_MODULE = /lib/modules/$(shell uname -r)/kernel/drivers/net/wireless/¬
124 CROSS_COMPILE =·¬
125 endif¬

apt-get install linux-headers-$(uname-r)

ln -s /usr/src/linux-headers-3.8.13-bone70/ /lib/modules/3.8.13-bone70/build



148f:7601
