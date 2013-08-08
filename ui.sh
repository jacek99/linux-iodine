echo "Rebuilding UI config..."

rm -rf filesystem/etc/skel/.config
mkdir -p filesystem/etc/skel/.config/xfce4
mkdir -p filesystem/etc/skel/.config/autostart
mkdir -p filesystem/etc/skel/.config/synapse
mkdir -p filesystem/etc/skel/.config/hotkeys

cp -r ~/.config/xfce4/* filesystem/etc/skel/.config/xfce4

cp -r ~/.config/autostart/synapse.desktop filesystem/etc/skel/.config/autostart

cp -r ~/.config/synapse/* filesystem/etc/skel/.config/synapse
cp -r ~/.config/hotkeys/synapse.hotkeys filesystem/etc/skel/.config/hotkeys/synapse.hotkeys

cp ~/.xscreensaver filesystem/etc/skel/.xscreensaver
