# iodine-livecd.ks
#
# Description:
# - Linux Iodine Live Remix with the XFCE Desktop Environment
#
# Maintainer(s):
# - Jacek Furmankiewicz <jacek99@gmail.com>


%include fedora-livecd-xfce-custom.ks
#%include /usr/share/rpmfusion-free-remix-kickstarts/rpmfusion-free-live-base.ks
#%include /usr/share/rpmfusion-nonfree-remix-kickstarts/rpmfusion-nonfree-live-base.ks
%include iodine-repos.ks

# repos
#repo --name=adobe --baseurl=http://linuxdownload.adobe.com/linux/x86_64/
#repo --name=fedorautils --baseurl=http://download.opensuse.org/repositories/home:/satya164:/fedorautils/Fedora_$releasever/

%packages

# release notes
-fedora-release
-fedora-logos
-fedora-release-notes
#generic-release
#generic-logos
#generic-release-notes

#repos
adobe-release

# office
libreoffice
thunderbird
mozilla-firetray-thunderbird
thunderbird-enigmail
thunderbird-lightning

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
audacity
gimp
openshot
vlc
vlc-extras
k9copy

gstreamer-plugins-bad
gstreamer-plugins-bad-free
gstreamer-plugins-bad-free-extras
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
gnome-packagekit
fedorautils
vim
#ruby
#golang
#java-1.7.0-openjdk
curl
wget

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
-thunar-vcs-plugin
-geany

%end

%post --nochroot
#!/bin/bash

echo "[IODINE] Copying extra files into ISO..."
cp -rf filesystem/* $INSTALL_ROOT/

echo "[IODINE] Copying additional RPMs into ISO..."
mkdir -p $INSTALL_ROOT/tmp/rpm
cp rpm/*.rpm $INSTALL_ROOT/tmp/rpm

%end

# within chroot, all local paths in the LiveCD
%post --erroronfail
#!/bin/bash

# RPMs
echo "[IODINE] Installing additional RPMs and packages..."
rpm -ivh /tmp/rpm/*.rpm

# BACKGROUNDS
echo "[INFO] Creating symlinks to GNOME backgrounds..."

mkdir -p /usr/share/xfce4/backdrops

for file in /usr/share/backgrounds/gnome/*
do
	ln -s $file  /usr/share/xfce4/backdrops/$(basename $file)
done

echo "[IODINE] Setting up Live User's desktop..."

mkdir -p /home/liveuser/.config
cp -rf /etc/skel/.config/* /home/liveuser/.config/

echo "[IODINE] Cleaning up..."

rm -rf /tmp/rpm

%end

