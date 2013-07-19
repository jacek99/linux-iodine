# iodine-livecd.ks
#
# Description:
# - Linux Iodine Live Remix with the XFCE Desktop Environment
#
# Maintainer(s):
# - Jacek Furmankiewicz <jacek99@gmail.com>

%include /usr/share/spin-kickstarts/fedora-livecd-xfce.ks
%include /usr/share/rpmfusion-free-remix-kickstarts/rpmfusion-free-live-base.ks
%include /usr/share/rpmfusion-nonfree-remix-kickstarts/rpmfusion-nonfree-live-base.ks

# repos
repo --name=adobe --baseurl=http://linuxdownload.adobe.com/linux/x86_64/

%packages

#repos
adobe-release

# office
libreoffice
#geany
evolution
evolution-ews

# internet
firefox
mozilla-adblockplus
mozilla-firetray-firefox
flash-plugin
NetworkManager-openconnect

# keyboard
synapse

#media
audacious
audacious-plugins*
#audacity
gimp
openshot
vlc
vlc-extras

gstreamer-plugins-bad
gstreamer-plugins-bad-free
gstreamer-plugins-bad-free-extras
#gstreamer-plugins-bad-nonfree
gstreamer-plugins-good-extras
gstreamer-plugins-ugly

# visual goodies
*-gtk2-theme
*-gtk3-theme
rss-glx-xscreensaver
gnome-backgrounds

# maybe Compiz? will think about it
#compiz-xfce
#compiz-plugins-extra
#emerald
#emerald-themes
#emerald-themes-extra
#fusion-icon

# system
#TODO: fedorautils
vim
#ruby
#golang
#java-1.7.0-openjdk
curl
wget
PackageKit
yum-plugin-fastestmirror
yum-plugin-remove-with-leaves
yum-plugin-upgrade-helper
grsync

# XFCE
thunar-*-plugin
xfce4-*-plugin
greybird-xfce4-notifyd-theme

# remove pieces we do not want
-abiword
-gnumeric
-pragha
-gtk-murrine-engine
-claws-mail*
-midori
-yumex
-parole
#-mousepad
#leafpad
-thunar-vcs-plugin

%end

%post --nochroot
#!/bin/bash

echo "[IODINE] Copying extra files into ISO..."
cp -rf filesystem/ $INSTALL_ROOT/

echo "[IODINE] Copying additional RPMs into ISO..."
mkdir -p $INSTALL_ROOT/opt/rpm
cp rpm/*.rpm $INSTALL_ROOT/opt/rpm

%end

# within chroot, all local paths in the LiveCD
%post --erroronfail
#!/bin/bash

# RPMs
echo "[IODINE] Installing additional RPMs and packages..."
yum localinstall /opt/*.rpm -y
yum install fedorautils

# BACKGROUNDS
echo "[INFO] Creating symlinks to GNOME backgrounds..."

mkdir -p /usr/share/xfce4/backdrops

for file in /usr/share/backgrounds/gnome/*
do
	ln -s $file  /usr/share/xfce4/backdrops/$(basename $file)
done

echo "[IODINE] Setting up Live User's desktop..."

cat > /home/liveuser/.config/xfce4/helpers.rc << FOE
MailReader=
FileManager=Thunar
WebBrowser=firefox
FOE

cp -f /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml /home/liveuser/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml


%end

