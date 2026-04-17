{ pkgs, ... }:

{
  environment.etc."i3status.conf".text = ''
    general {
        colors = true
        interval = 5
    }

    order += "cpu_usage"
    order += "memory"
    order += "volume master"
    order += "wireless _first_"
    order += "battery all"
    order += "tztime local"

    cpu_usage { format = "CPU: %usage" }
    memory { format = "RAM: %used" }
    volume master {
        format = "Vol: %volume"
        device = "default"
    }
    wireless _first_ {
        format_up = "W: %quality"
        format_down = "W: down"
    }
    battery all {
        format = "%status %percentage"
        status_chr = "⚡"
        status_bat = "🔋"
    }
    tztime local { format = "%H:%M" }
  '';
}
