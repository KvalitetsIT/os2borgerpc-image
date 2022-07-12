#!/bin/bash

set -x

printf "\n\n%s\n\n" "===== RUNNING: $0 (INSIDE SQUASHFS) ====="


# You have entered the squashed system as root.
export DEBIAN_FRONTEND=noninteractive

apt-get -y update

echo "Removing packages we don't need, before we upgrade all packages:"
# Things to get rid of. Factor out to file if many turn up.
# deja-dup because...?
# libfprint-2-2 because it fails during installation/updating because of an unmet interactive step, but we don't need finger print reading anyway so we can delete it
# gnome-todo, thunderbird and transmission because they likely aren't needed by users
apt-get -y remove --purge deja-dup libfprint-2-2 gnome-todo thunderbird transmission-gtk

echo "Now upgrading all packages:"
apt-get -y upgrade
# Ignore error about zsys daemon
apt-get -y install git

# Run customization, from the image/image directory which is bind-mounted in
/mnt/scripts/os2borgerpc_setup.sh
/mnt/scripts/finalize.sh

# Cleanup

apt-get -y autoremove --purge
apt-get -y clean
