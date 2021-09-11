# This file is used to customize the XFCE desktop

#   changed : xfce4-appfinder
# unchanged : xfce4-notifyd 
# unchanged : displays
# unchanged : xfwm4
# xfce4-panel
# xfce4-keyboard-shortcuts
# xfce4-session
# thunar
# keyboards
# xfce4-desktop
# unchanged : xfce4-power-manager
#   changed : xsettings

# ----- xfce4-appfinder -----
xfconf-query -c xfce4-appfinder -p /remember-category -s false
xfconf-query -c xfce4-appfinder -p /always-center -s true
xfconf-query -c xfce4-appfinder -p /enable-service -s true
xfconf-query -c xfce4-appfinder -p /single-window -s true
xfconf-query -c xfce4-appfinder -p /item-icon-size -s 3
xfconf-query -c xfce4-appfinder -p /hide-category-pane -s true

# ----- xsettings -----
xfconf-query -c xsettings -p /Net/ThemeName -s Adwaita-dark
xfconf-query -c xsettings -p /Net/IconThemeName -s ePapirus-Dark
xfconf-query -c xsettings -p /Gtk/FontName -s "Sans 12"
xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "Monospace 12"

# ----- xfce4-desktop -----
xfconf-query -c xfce4-desktop -p /backdrop/single-workspace-mode -s true
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP-1/workspace0/last-image -s "/usr/share/backgrounds/xfce/xfce-teal.jpg"
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem -s false
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home -s false
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-removable -s false
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-trash -s false
xfconf-query -c xfce4-desktop -p /desktop-icons/show-thumbnails -s false
xfconf-query -c xfce4-desktop -p /desktop-icons/show-thumbnails -s false






