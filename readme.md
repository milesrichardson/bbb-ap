Tested with:

    http://debian.beagleboard.org/images/bone-debian-7.8-lxde-4gb-armhf-2015-03-01-4gb.img.xz
    
    md5:c848627722b7a5f7bc89791cc8949e3b


# Load debian image onto SD card (Mac OS X)

http://beagleboard.org/latest-images

download and extract latest image (automatic on mac)

if sd card in mac, remove it.

run:
    
    diskutil list

insert sd card.

run again

    diskutil list

determine which /dev/diskN is the sd card

execute:

    sudo dd if=/path/to/downloaded.img of /dev/rdiskN bs=1m

wait. loading image onto SD card.

    diskutil eject /dev/diskN

# Flash beaglebone with image

power down, unplug beagle bone black

insert SD card

hold down button next to SD card

while holding, insert power (5V barrel connector preferred over USB)

continue holding until all 4 LED lights flash solid, then let go

wait a bit.

# Connect to beaglebone

plug ethernet cable with internet connection into beaglebone

connect to beaglebone via ssh

    ssh root@beaglebone.local

or

    ssh root@192.168.2.2

or

    username debian
    password temppwd

or via this repository,

    make attach


# Disconnect beaglebone

    exit

# Run flash script from host machine

on host machine:

    cd bbb-ap
    make flash

wait. 

# After pushing updates to git repo, can simply update

    cd bbb-ap
    make update

# Check driver

    lsusb -t


# Dependencies

    milesrichardson/mt7601u

# dhcpd instructions

    apt-get install udhcpd

http://elinux.org/RPI-Wireless-Hotspot

may need to use some of the iptables rules from there (RELATED,ESTABLISHED)
but also might be enough to use those from ./load

/etc/udhcpd.conf

    start 192.168.199.2
    end 192.168.199.20
    interface ra0
    remaining yes
    opt dns 8.8.8.8 4.2.2.2
    opt subnet 255.255.255.0
    opt router 192.168.42.1
    opt lease 864000

/etc/default/udhcpd

change

    DHCPD_ENABLED="no"

to 

    #DHCPD_ENABLED="no"
service udhcpd start

might also need to

/etc/network/interfaces

    allow-hotplug ra0
    iface ra0 inet static
      address 192.168.199.1
      netmask 255.255.255.0


# l2tp instructions

http://www.elastichosts.com/support/tutorials/linux-l2tpipsec-vpn-client/

    apt-get install openswan xl2tpd lsof

^ Need to select "No" -- how to?

update /etc/ipsec.conf like in configs


    # Disable send redirects
echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/default/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/eth0/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/lo/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/default/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/eth0/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/lo/accept_redirects

or

Edit /etc/sysctl.conf and add or uncomment the following lines:

net.ipv4.ip_forward=1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.eth0.send_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.conf.eth0.accept_redirects = 0

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
