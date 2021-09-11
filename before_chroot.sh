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
pacman -Syy reflector

# Fetch mirror list 
reflector -c "IN" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist

# Install essential packages
# pacstrap /mnt base base-devel linux linux-firmware neovim fish tmux
pacstrap /mnt base linux neovim fish tmux

# Generate fstab file
genfstab -U /mnt >> /mnt/etc/fstab

# Change root to new system
arch-chroot /mnt

# Generate locale
# sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
locale-gen en_US.UTF-8

echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
localectl set-locale LANG=en_US.UTF-8

# Set timezone
timedatectl set-timezone Asia/Kolkata

# Sync time to hardware clock
hwclock --systohc

# Add hostname entry
echo arch > /etc/hostname
    
# Create the host file
touch /etc/hosts

# Add following lines to the hosts file
echo -e 127.0.0.1'\t'localhost'\n'::1'\t\t'localhost'\n'127.0.1.1'\t'arch >> /etc/hosts

# Setup root password
passwd

# Generate initramfs
mkinitcpio -p linux

# Create directory to mount EFI partition
mkdir /boot/efi

# Mount EFI partition
mount /dev/sda1 /boot/efi

# Install & setup grub 
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

# Install & setup network
pacman -S networkmanager network-manager-applet
systemctl enable NetworkManager

# Install regular user
useradd -m -G wheel -s /bin/fish snowball

# Set password for new user
passwd snowball

# Enable sudoers
sed -i 's/# %wheel ALL=(ALL) ALL/  %wheel ALL=(ALL) ALL/' /etc/sudoers

# Install Microcode
# pacman -S amd-ucode
  pacman -S intel-ucode

# Install Graphics Driver
# pacman -S xf86-video-intel
# pacman -S xf86-video-amdgpu
  pacman -S nvidia nvidia-utils
    
# Display Server
pacman -S xorg

# Display Manager
pacman -S lightdm lightdm-gtk-greeter
systemctl enable lightdm

# Install packages for GUI
pacman -S xfce4 papirus-icon-theme xfce4-taskmanager xfce4-screenshooter

# Install filemanager
pacman -S xarchiver unzip thunar-archive-plugin thunar-volman mtpfs libmtp gvfs gvfs-mtp android-tools android-udev

# Intall packages for audio
pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth xfce4-pulseaudio-plugin pavucontrol

# Install bluetooth
pacman -S blueman bluez bluez-utils
systemctl enable bluetooth.service

# Install Firewall
pacman -S gufw

# TRIM for SSDs
sudo systemctl enable fstrim.timer

# Reboot
exit
unmount -a
reboot
