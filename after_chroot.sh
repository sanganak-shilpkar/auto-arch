# uncomment required locale
sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen

# generate locale
locale-gen

# create locale.conf & set LANG variable
localectl set-locale LANG=en_US.UTF-8
export LANG=en_US.UTF-8
# export LANGUAGE=$LANG
# export LC_ALL=$LANG

# set timezone
timedatectl set-timezone Asia/Kolkata

# sync time to hardware clock
hwclock --systohc

# add hostname entry
echo arch > /etc/hostname
    
# create the host file
touch /etc/hosts

# add following lines to the hosts file
echo -e 127.0.0.1'\t'localhost'\n'::1'\t\t'localhost'\n'127.0.1.1'\t'arch >> /etc/hosts

# setup root password
passwd

# generate initramfs
mkinitcpio -p linux

# create directory to mount EFI partition
mkdir /boot/efi

# mount EFI partition
mount /dev/sda1 /boot/efi

# install shell packages
pacman -S neovim fish tmux git sudo fakeroot which --noconfirm

# set defaults
echo 'export export VISUAL=nvim' | tee -a /etc/profile
echo 'export export EDITOR=$VISUAL' | tee -a /etc/profile

# install & setup grub 
pacman -S grub efibootmgr --noconfirm
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

# install & setup network
pacman -S networkmanager network-manager-applet --noconfirm
systemctl enable NetworkManager

# add regular user
useradd -m -G wheel -s /bin/fish snowball

# set password for new user
passwd snowball

# enable sudo for wheel group
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers

# install microcode
# pacman -S amd-ucode --noconfirm
# pacman -S intel-ucode --noconfirm

# install graphics driver
# pacman -S xf86-video-intel --noconfirm
# pacman -S xf86-video-amdgpu --noconfirm
# pacman -S nvidia nvidia-utils --noconfirm
    
# install display Server
pacman -S xorg --noconfirm

# install display manager
pacman -S lightdm lightdm-gtk-greeter --noconfirm
systemctl enable lightdm

# install desktop environment
pacman -S xfce4 papirus-icon-theme xfce4-taskmanager xfce4-screenshooter --noconfirm

# install packages for filemanager
pacman -S xarchiver unzip thunar-archive-plugin thunar-volman mtpfs libmtp gvfs gvfs-mtp android-tools android-udev --noconfirm

# intall packages for audio
pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth xfce4-pulseaudio-plugin pavucontrol --noconfirm

# install & setup bluetooth
pacman -S blueman bluez bluez-utils --noconfirm
systemctl enable bluetooth.service

# install Firewall
pacman -S gufw --noconfirm

# enable TRIM for SSDs
systemctl enable fstrim.timer

# restore XFCE settings
curl https://raw.githubusercontent.com/sanganak-shilpkar/auto-arch/main/xfce.sh > xfce.sh
sh xfce.sh
rm xfce

# setup XFCE panel
curl https://raw.githubusercontent.com/sanganak-shilpkar/auto-arch/main/xfce4-panel.xml > ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml

# update fish hostname to uname -n for theme
sed -i 's/hostname/uname -n/' ~/.config/fish/functions/fish_prompt.fish
sed -i 's/hostname/uname -n/' ~/.config/fish/functions/fish_prompt.fish

# install omf and theme for fish
curl -L https://get.oh-my.fish | fish
omf install boxfish

# Reboot
# exit
# unmount -a
# reboot
