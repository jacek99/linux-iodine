# iodine-livecd.ks
#
# Description:
# - Linux Iodine Live Remix with the Cinnamon Desktop Environment
#
# Maintainer(s):
# - Jacek Furmankiewicz <jacek99@gmail.com>

%include /usr/share/spin-kickstarts/fedora-livecd-desktop.ks

%packages

@cinnamon
pidgin
guake

# remove pieces of GNOME 3 we don't want to be present
-nautilus
-empathy
-gnome-boxes

%end


%post

%end

