# Check internet connection.
if nc -zw1 google.com 443
then
  echo "Internet detected. Stand by for further instructions ..."
else 
    echo "Internet not detected. Type "wifi-menu". Connect to the internet and try again !"
    exit
fi

# Update system clock
timedatectl set-ntp true

# Delete partition table
wipefs -a -f /dev/sda

# Create parition for EFI
(
echo n      # create EFI partition
echo p      # primary type
echo        # default partition number
echo        # default first sector
echo +512M  # +512M last sector
echo n      # create / partition
echo p      # primary type
echo        # default partition number
echo        # default first sector
echo        # default last sector ( entire disk )
echo w      # write changes 
) | fdisk /dev/sda -w always -W always

# Format EFI partition
mkfs.fat -F32 /dev/sda1

# Format / partition
mkfs.ext4 /dev/sda2

# Mount filesystem
mount /dev/sda2 /mnt

# Sync pacman repos & install reflector
pacman -Syy reflector --noconfirm

# Fetch mirror list 
reflector -c "IN" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist

# Install essential packages
pacstrap /mnt base base-devel linux linux-firmware

# Fetch second script
curl https://raw.githubusercontent.com/sanganak-shilpkar/auto-arch/main/after_chroot.sh > /mnt/after_chroot.sh

# Generate fstab file
genfstab -U /mnt >> /mnt/etc/fstab

# Change root to new system & run second script
arch-chroot /mnt sh after_chroot.sh



