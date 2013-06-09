# fedora-livecd-xfce.ks
#
# Description:
# - Fedora Live Spin with the light-weight XFCE Desktop Environment
#
# Maintainer(s):
# - Rahul Sundaram    <sundaram@fedoraproject.org>
# - Christoph Wickert <cwickert@fedoraproject.org>
# - Kevin Fenzi       <kevin@tummy.com>
# - Adam Miller       <maxamillion@fedoraproject.org>


%packages

# remove some Fedora XFCE choices that we replace
-abiword
-gnumeric
-leafpad
-yumex
-thunderbird
-claws-mail*
-liferea
-midori

# add extra packages we want
gimp
libreoffice
geany
PackageKit
PackageKit-yum
evolution-ews
evolution-rss
evolution-mapi
synapse
arandr
evince

# common dev tools - all batteries included
python-pip
python-devel
ruby-devel
golang*
emacs
vim



%end
