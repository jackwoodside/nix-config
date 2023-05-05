#!/bin/sh

# Print disks, ask for disk to install on
ls /dev/disk/by-id
ls /dev/disk/by-path
echo
echo "Enter the name of the disk to install NixOS on:"
read -r DISK
echo

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
mkdir -p /mnt/nix
mkdir -p /mnt/etc/nixos
mkdir -p /mnt/var/log

mount "$DISK"-part1 /mnt/nix
mount "$DISK"-part2 /mnt/boot

mkdir -p /mnt/nix/persist/etc/nixos
mkdir -p /mnt/nix/persist/var/log

mount -o bind /mnt/nix/persist/etc/nixos /mnt/etc/nixos
mount -o bind /mnt/nix/persist/var/log /mnt/var/log

# Generate the config
nixos-generate-config --root /mnt
