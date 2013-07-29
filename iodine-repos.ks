# Make sure you read /usr/share/doc/rpmfusion-nonfree-remix-kickstarts*/README 
# before distributing a linux distribution that is build with this kickstart file
#
# Reminder: The RPM Fusion Nonfree repos depend on the Free repos; so you should
# include /usr/share/rpmfusion-free-remix-kickstarts/rpmfusion-free-live-base.ks
# directly or indirectly via some other "live" kickstart file from the package
# rpmfusion-free-remix-kickstarts in any kickstart files that include this file.
#
# Please note that the repos are configured to just track in 
# rpmfusion-nonfree-release and nothing else
#
## Reminder: enable and disable as well as modify following repos to make sure
## the repos match what is configured in fedora-live-base.ks

# To compose against the current release tree, use the following "repo"
repo --name=rpmfusion-nonfree --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-19&arch=$basearch --includepkgs=rpmfusion-nonfree-release
# To include updates, use the following "repo"
repo --name=rpmfusion-nonfree-updates --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-19&arch=$basearch --includepkgs=rpmfusion-nonfree-release

# To compose against the current release tree, use the following "repo"
repo --name=rpmfusion-free-released --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-19&arch=$basearch
# To include updates, use the following "repo"
repo --name=rpmfusion-free-updates --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-19&arch=$basearch

repo --name=adobe --baseurl=http://linuxdownload.adobe.com/linux/x86_64/
repo --name=fedorautils --baseurl=http://download.opensuse.org/repositories/home:/satya164:/fedorautils/Fedora_$releasever/

#%packages
# unbrand; should be done by rpmfusion-free-live-base.ks, but we do it here as
# well just to be sure
#-fedora-release
#-fedora-logos
#-fedora-release-notes
#generic-release
#generic-logos
#generic-release-notes
#%end

%post
echo "== RPM Fusion Nonfree: Base section =="
echo "Importing RPM Fusion keys"
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-*-primary
echo "List of packages from RPM Fusion Nonree:"
rpm -qa --qf '%{NAME} %{SIGGPG:pgpsig} %{SIGPGP:pgpsig} \n' | grep -e 00166716cd30c86b | awk ' { print $1 } ' | sort
echo "List of incuded RPM Fusion packages with their size:"
rpm -q --qf '%{SIZE} %{NAME}\n' $(rpm -qa --qf '%{NAME} %{SIGGPG:pgpsig} %{SIGPGP:pgpsig} \n' | grep -e 00166716cd30c86b | awk ' { print $1 } ') | sort -n
echo

echo "== RPM Fusion Free: Base section =="
echo "Importing RPM Fusion keys"
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-*-primary
echo "List of packages from RPM Fusion Free:"
rpm -qa --qf '%{NAME} %{SIGGPG:pgpsig} %{SIGPGP:pgpsig} \n' | grep -e 6f6382f9172ff33d | awk ' { print $1 } ' | sort
echo "List of incuded RPM Fusion packages with their size:"
rpm -q --qf '%{SIZE} %{NAME}\n' $(rpm -qa --qf '%{NAME} %{SIGGPG:pgpsig} %{SIGPGP:pgpsig} \n' | grep -e 6f6382f9172ff33d | awk ' { print $1 } ') | sort -n
%end

