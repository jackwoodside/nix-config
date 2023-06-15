#!/bin/sh

# Print disks, ask for disk to install on
ls /dev/disk/by-id/*
echo
echo "Enter the path of the disk to install NixOS on:"
read -r DISK
echo "User name:"
read -r USERNAME
echo "User password (hidden):"
read -s -r USERPASS
echo "Root password (hidden):"
read -s -r ROOTPASS
echo "Hostname:"
read -r HOSTNAME
echo "Timezone (Country/City):"
read -r TIMEZONE
echo "Nvidia? y/(n)"
read -r NVIDIA

# Wipe disk
echo "$DISK"
echo "THE DISK ABOVE WILL BE WIPED"
echo "Are you sure this is the correct disk? y/(n)"
read -r WIPE
if [ "$WIPE" = "y" ]; then
    wipefs -a -f "$DISK"
else
    exit
fi

# Create partitions
parted "$DISK" -- mklabel gpt
parted "$DISK" -- mkpart primary 512MB 100%
parted "$DISK" -- mkpart ESP fat32 1MB 512MB
parted "$DISK" -- set 2 esp on

# Format partitions
mkfs.ext4 -F -F -L nixos "$DISK"-part1
mkfs.fat -F 32 -n boot "$DISK"-part2

# Mount filesystems
mount -t tmpfs none /mnt

mkdir -p /mnt/nix
mount "$DISK"-part1 /mnt/nix
mkdir -p /mnt/boot
mount "$DISK"-part2 /mnt/boot

# Generate the config
nixos-generate-config --root /mnt

# Fix tmpfs options
sed -i /'tmpfs'/a'\      options = [ "defaults" "size=2G" "mode=755" ];' /mnt/etc/nixos/hardware-configuration.nix

# Configure user options
if [ "$NVIDIA" = "y" ]; then
    sed -i /'# Graphics'/a'\  services.xserver.videoDriver = [ "nvidia" ];' ./configuration.nix
fi
sed -i s/USERNAME/"$USERNAME"/ ./configuration.nix
sed -i s/USERNAME/"$USERNAME"/ ./persistence-home/default.nix
sed -i s/USERNAME/"$USERNAME"/ ./persistence-home/persistence.nix
sed -i s/USERNAME/"$USERNAME"/ ./persistence-home/programs/fish.nix
sed -i s/USERNAME/"$USERNAME"/ ./persistence-home/programs/x.nix
sed -i s/USERNAME/"$USERNAME"/ ./persistence-home/programs/scripts/lock

sed -i "s|USERPASS|$(nix-shell --run "mkpasswd -m SHA-512 '$USERPASS'" -p mkpasswd)|" ./configuration.nix
sed -i "s|ROOTPASS|$(nix-shell --run "mkpasswd -m SHA-512 '$ROOTPASS'" -p mkpasswd)|" ./configuration.nix
sed -i s/HOSTNAME/"$HOSTNAME"/ ./configuration.nix
sed -i "s|TIMEZONE|$TIMEZONE|" ./configuration.nix

cp -r ./* /mnt/etc/nixos/
rm /mnt/etc/nixos/install.sh
rm /mnt/etc/nixos/README.md

# Install
nixos-install --no-root-passwd || (echo "Installation failed" && exit)
echo "Installation complete, rebooting in 5 seconds"
sleep 5
reboot
