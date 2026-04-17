{ pkgs, ... }:

{
  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
    extraPackages = with pkgs; [ i3status i3lock dmenu ];
  };



  services.xserver.windowManager.i3.configFile = pkgs.writeText "i3-config" ''
    set $mod Mod4

    bar {
        status_command i3status
    }
    exec_always --no-startup-id blueman-applet &
    exec_always --no-startup-id volumeicon &


    bindsym $mod+Return exec kitty
    bindsym $mod+d exec dmenu_run
    bindsym $mod+Shift+q exec kill
    bindsym $mod+Shift+e exec i3-msg exit
    bindsym $mod+Shift+r exec i3-msg reload
    bindsym $mod+Shift+b exec firefox

    bindsym $mod+1 workspace 1
    bindsym $mod+2 workspace 2
    bindsym $mod+3 workspace 3
    bindsym $mod+4 workspace 4
    bindsym $mod+5 workspace 5

    bindsym $mod+h focus left
    bindsym $mod+j focus down
    bindsym $mod+k focus up
    bindsym $mod+l focus right

    bindsym Print exec flameshot gui
    bindsym $mod+Print exec flameshot full -p ~/Pictures/Screenshots
    bindsym $mod+Shift+Print exec flameshot full -p ~/Pictures/Screenshots -c

    set $bg      #2e3440
    set $bg-alt  #3b4252
    set $fg      #e5e9f0
    set $blue    #81a1c1

    client.focused $blue $blue $fg $blue $blue
    client.unfocused $bg-alt $bg-alt $fg $bg-alt $bg-alt

    # Volume control with visual feedback
    set $refresh_i3status killall -SIGUSR1 i3status

    bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && $refresh_i3status
    bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && $refresh_i3status
    bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status

  '';
}
