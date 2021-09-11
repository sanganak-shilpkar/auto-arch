# This file is used to customize the XFCE desktop

#   changed : xfce4-appfinder
# unchanged : xfce4-notifyd 
# unchanged : displays
# unchanged : xfwm4
# xfce4-panel
#   changed : xfce4-keyboard-shortcuts
# unchanged : xfce4-session
# unchanged : thunar
# unchanged : keyboards
#   changed : xfce4-desktop
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

# ----- xfce4-keyboard-shortcuts -----

# window operation menu
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Alt>space" -s "popup_menu_key"

# cancel operation
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/Escape" -s "cancel_key"

# cycle windows
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Alt>Tab" -s "cycle_windows_key"

# close window
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Alt>F4" -s "close_window_key"

# move to left workspace
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary><Alt>Left" -s "left_workspace_key"

# move to right workspace
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary><Alt>Right" -s "right_workspace_key"

# ===== window management =====

# maximize window : <Super>[ Up Arrow ]
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>Up" -n -t string -s maximize_window_key
# minimize window : <Super>[ Down Arrow ]
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>Down" -n -t string -s hide_window_key

# move window to LEFT : <Super>[ Left Arrow ] 
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>Left" -n -t string -s tile_left_key
# move window to RIGHT : <Super>[ Right Arrow ] 
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>Right" -n -t string -s tile_right_key

# move window to TOP LEFT : <Super> [ Numpad 8 ]
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>KP_Up" -n -t string -s tile_up_left_key
# move window to TOP RIGHT : <Super>[ Numpad 9 ]
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>KP_Page_Up" -n -t string -s tile_up_right_key

# move window to DOWN LEFT : <Super>[ Numpad 5]
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>KP_Begin" -n -t string -s tile_down_left_key
# move window to DOWN RIGHT : <Super>[ Numpad 6]
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>KP_Right" -n -t string -s tile_down_right_key

# Toggle window raise : <Super>[ Numpad 7 ]
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>KP_Home" -n -t string -s above_key

# Show desktop : <Primary><Alt>d
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary><Alt>d" -n -t string -s show_desktop_key

# ===== switch workspaces =====

# switch to workspace 1...2 for <Primary>F1...F12

xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary>F1" -n -t string -s workspace_1_key
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary>F2" -n -t string -s workspace_2_key
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary>F3" -n -t string -s workspace_3_key
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary>F4" -n -t string -s workspace_4_key
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary>F5" -n -t string -s workspace_5_key



