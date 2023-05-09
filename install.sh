#!/bin/sh

# Print disks, ask for disk to install on
ls /dev/disk/by-id/*
echo
echo "Enter the path of the disk to install NixOS on:"
read -r DISK
echo "User name:"
read -r USERNAME
echo "User password:"
read -r USERPASS
echo "Root password:"
read -r ROOTPASS
echo "Hostname:"
read -r HOSTNAME
echo "Timezone (Country/City):"
read -r TIMEZONE
echo "Nvidia? y/(n)"
read -r NVIDIA

# Create partitions
parted "$DISK" -- mklabel gpt
parted "$DISK" -- mkpart primary 512MB 100%
parted "$DISK" -- mkpart ESP fat32 1MB 512MB
parted "$DISK" -- set 2 esp on

# Format partitions
mkfs.ext4 -L nixos "$DISK"-part1
mkfs.fat -F 32 -n boot "$DISK"-part2

# Mount filesystems
mount -t tmpfs none /mnt

mkdir -p /mnt/boot
mount "$DISK"-part1 /mnt/nix
mkdir -p /mnt/nix
mount "$DISK"-part2 /mnt/boot

mkdir -p /mnt/nix/persist/etc/nixos
mkdir -p /mnt/etc/nixos
mount -o bind /mnt/nix/persist/etc/nixos /mnt/etc/nixos

mkdir -p /mnt/nix/persist/var/log
mkdir -p /mnt/var/log
mount -o bind /mnt/nix/persist/var/log /mnt/var/log

# Generate the config
nixos-generate-config --root /mnt

# Fix tmpfs options
sed -i /tmpfs/a'\      options = [ "defaults" "size=2G" "mode=755" ];' /mnt/etc/nixos/hardware-configuration.nix

# Configure user options
if [ "$NVIDIA" = "y" ]; then
    sed -i /# Graphics/a'\  services.xserver.videoDriver = [ "nvidia" ];' ./configuration.nix
fi
sed -i s/USERNAME/"$USERNAME" ./configuration.nix
USERPASS=$(echo "$USERPASS" | sed "s/\//\\\//g") # escape sed delimiters
sed -i s/USERPASS/"$USERPASS" ./configuration.nix
ROOTPASS=$(echo "$ROOTPASS" | sed "s/\//\\\//g") # escape sed delimiters
sed -i s/ROOTPASS/"$ROOTPASS" ./configuration.nix
sed -i s/HOSTNAME/"$HOSTNAME" ./configuration.nix
sed -i s/TIMEZONE/"$TIMEZONE" ./configuration.nix
