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

%packages
# office
libreoffice
#geany
#evolution
#evolution-ews


# internet
firefox

# keyboard
synapse

#media
audacious
audacious-plugins*
#audacity
gimp
openshot

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
#vim
#ruby
#golang
#java-1.7.0-openjdk
PackageKit
yum-plugin-fastestmirror
yum-plugin-remove-with-leaves
yum-plugin-upgrade-helper

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
#-mousepad
#leafpad


%end

# within chroot, all local paths in the LiveCD
%post --erroronfail
#!/bin/bash

mkdir -p /usr/share/xfce4/backdrops

echo "Creating symlinks to GNOME backgrounds"
for file in /usr/share/backgrounds/gnome/*
do
	ln -s $file  /usr/share/xfce4/backdrops/$(basename $file)
done

%end

