# Generate locale
sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
locale-gen

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

# Install shell tools
pacman -S neovim fish tmux git sudo fakeroot which --noconfirm

# Set defaults
echo 'export export VISUAL=nvim' | tee -a /etc/profile
echo 'export export EDITOR=$VISUAL' | tee -a /etc/profile

# Install & setup grub 
pacman -S grub efibootmgr --noconfirm
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

# Install & setup network
pacman -S networkmanager network-manager-applet --noconfirm
systemctl enable NetworkManager

# Install regular user
useradd -m -G wheel -s /bin/fish snowball

# Set password for new user
passwd snowball

# Enable sudoers
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers

# Install Microcode
# pacman -S amd-ucode --noconfirm
# pacman -S intel-ucode --noconfirm

# Install Graphics Driver
# pacman -S xf86-video-intel --noconfirm
# pacman -S xf86-video-amdgpu --noconfirm
#  pacman -S nvidia nvidia-utils --noconfirm
    
# Display Server
pacman -S xorg --noconfirm

# Display Manager
pacman -S lightdm lightdm-gtk-greeter --noconfirm
systemctl enable lightdm

# Install packages for GUI
pacman -S xfce4 papirus-icon-theme xfce4-taskmanager xfce4-screenshooter --noconfirm

# Install filemanager
# pacman -S xarchiver unzip thunar-archive-plugin thunar-volman mtpfs libmtp gvfs gvfs-mtp android-tools android-udev --noconfirm

# Intall packages for audio
# pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth xfce4-pulseaudio-plugin pavucontrol --noconfirm

# Install bluetooth
# pacman -S blueman bluez bluez-utils --noconfirm
# systemctl enable bluetooth.service

# Install Firewall
# pacman -S gufw --noconfirm

# TRIM for SSDs
# systemctl enable fstrim.timer

# Reboot
exit
unmount -a
reboot
