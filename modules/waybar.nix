{ ... }:
{
  programs.waybar = {
    enable = true;
    # systemd.enable = true;
    settings = {
      mainBar = {
        backlight = {
          device = "intel_backlight";
          format = "{icon} {}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          scroll-step = 5;
          tooltip = false;
        };
        battery = {
          format = "{icon} {capacity}%";
          format-charging = "󱐋 {capacity}%";
          format-full = "󱟢 {capacity}%";
          format-icons = {
            default = [
              "󰂎"
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂂"
            ];
          };
          interval = 5;
          states = {
            critical = 15;
          };
          tooltip = false;
        };
        "clock#date" = {
          actions = {
            on-click-right = "mode";
          };
          calendar = {
            format = {
              months = "<span color='#f5e0dc'><b>{}</b></span>";
              today = "<span color='#f38ba8'><b>{}</b></span>";
              weekdays = "<span color='#f9e2af'><b>{}</b></span>";
            };
            mode = "month";
            mode-mon-col = 3;
            on-click-right = "mode";
          };
          format = "󱨴 {:%d-%m}";
          max-length = 8;
          min-length = 8;
          tooltip-format = "<tt>{calendar}</tt>";
        };
        "clock#time" = {
          format = "󱑂 {:%H:%M}";
          max-length = 8;
          min-length = 8;
          tooltip = false;
        };
        cpu = {
          format = "󰻠 {usage}%";
          interval = 5;
          max-length = 7;
          min-length = 7;
          tooltip = false;
        };
        "custom/OS" = {
          format = " ";
          tooltip = false;
        };
        "custom/left-1" = {
          format = "";
          tooltip = false;
        };
        "custom/left-2" = {
          format = "";
          tooltip = false;
        };
        "custom/left-3" = {
          format = "";
          tooltip = false;
        };
        "custom/left-4" = {
          format = "";
          tooltip = false;
        };
        "custom/left-5" = {
          format = "";
          tooltip = false;
        };
        "custom/left-6" = {
          format = "";
          tooltip = false;
        };
        "custom/left-7" = {
          format = "";
          tooltip = false;
        };
        "custom/left-8" = {
          format = "";
          tooltip = false;
        };
        "custom/left-9" = {
          format = "";
          tooltip = false;
        };
        "custom/leftin-1" = {
          format = "";
          tooltip = false;
        };
        "custom/leftin-2" = {
          format = "";
          tooltip = false;
        };
        "custom/pad" = {
          format = " ";
          tooltip = false;
        };
        "custom/right-1" = {
          format = "";
          tooltip = false;
        };
        "custom/right-2" = {
          format = "";
          tooltip = false;
        };
        "custom/right-3" = {
          format = "";
          tooltip = false;
        };
        "custom/right-4" = {
          format = "";
          tooltip = false;
        };
        "custom/right-5" = {
          format = "";
          tooltip = false;
        };
        "custom/rightin-1" = {
          format = "";
          tooltip = false;
        };
        "custom/ws" = {
          format = "  ";
          tooltip = false;
        };
        "hyprland/window" = {
          format = "{}";
          max-length = 33;
          min-length = 5;
          rewrite = {
            "" = "<span foreground='#cba6f7'></span> Nitro 󰅂 Hyprland";
            "(.*) - Discord" = "<span foreground='#89b4fa'></span> $1";
            "(.*) - Vivaldi" = "<span foreground='#f38ba8'>󰈹</span> $1";
            kitty = " Terminal";
            "nitro@nixos: ~" = " Terminal";
            "nitro@nixos:(.*)" = "$1";
          };
          separate-outputs = true;
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "󰋙";
          };
        };
        layer = "top";
        memory = {
          format = "󰍛 {percentage}%";
          format-c = "󰀪 {percentage}%";
          interval = 20;
          max-length = 7;
          min-length = 7;
          states = {
            threshold = 90;
          };
          tooltip = true;
          tooltip-format = "{used:0.1f}GB / {total:0.1f}GB";
        };
        modules-center = [
          "custom/left-4"
          "network#speed"
          "custom/left-3"
          "memory"
          "custom/left-2"
          "clock#time"
          "custom/leftin-1"
          "custom/left-1"
          "custom/OS"
          "custom/right-1"
          "custom/rightin-1"
          "clock#date"
          "custom/right-2"
          "cpu"
          "custom/right-3"
          "network#name"
          "custom/right-4"
        ];
        modules-left = [
          "custom/ws"
          "custom/left-5"
          "hyprland/workspaces"
          "custom/right-5"
          "custom/pad"
          "hyprland/window"
        ];
        modules-right = [
          "custom/left-9"
          "pulseaudio"
          "custom/left-8"
          "backlight"
          "custom/left-7"
          "battery"
          "custom/leftin-2"
          "custom/left-6"
          "temperature"
        ];
        "network#name" = {
          format-disconnected = "󰞃 N/A";
          format-icons = [
            "󰢿"
            "󰢼"
            "󰢽"
            "󰢾"
          ];
          format-wifi = " {icon} Wifi";
          interval = 5;
          max-length = 8;
          min-length = 8;
          tooltip = true;
          tooltip-format-wifi = "{essid} ({signalStrength}%)\n{ipaddr}";
        };
        "network#speed" = {
          format-disconnected = "0 B/s";
          format-wifi = "{bandwidthTotalBytes}";
          interval = 5;
          max-length = 8;
          min-length = 8;
          tooltip = true;
          tooltip-format-wifi = " {bandwidthUpBytes}\n {bandwidthDownBytes}";
        };
        position = "top";
        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "󰂯 {volume}%";
          format-icons = {
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          format-muted = "󰝟 ";
          on-click = "pavucontrol";
          scroll-step = 5;
          tooltip = false;
        };
        temperature = {
          format = " {temperatureC}°C";
          interval = 10;
          thermal-zone = 1;
          tooltip = false;
        };
        tray = {
          spacing = 5;
        };
        user = {
          format = "{user}";
          interval = 60;
        };
        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 16;
          icon-theme = "Numix-Circle";
          on-click = "activate";
          on-click-middle = "close";
          tooltip = false;
          tooltip-format = "{title}";
        };
      };
    };
    style = ''
      * {
          background: none;
          font-family: "SpaceMono Nerd Font";
          font-weight: bold;
          font-size: 14px;
          min-height: 15px;
      }
      @define-color main-bg #11111b;
      @define-color main-fg #F8E3CA;

      @define-color   nix         #7EB8E1;
      @define-color   nix-alt     #5277C3;
      @define-color   shadow      rgba(0, 0, 0, 1);
      @define-color   clock       #405970;
      @define-color   hardware    #304154;
      @define-color   network     #212937;

      window#waybar {
          background: @main-bg;
      }

      tooltip {
          background: @main-bg;
          color: @main-fg;
          border: solid;
          border-radius: 7px;
          border-width: 1px;
          border-color: @nix;
      }

      #custom-OS {
          text-shadow: none;
          font-size: 16pt;
          color: @nix-alt;
          padding-left: 4px;
          background: @nix;
          text-shadow: 0px 0px 1px rgba(0, 0, 0, 1);
      }

      #workspaces button {
          box-shadow: none;
          text-shadow: 0px 0px 2px rgba(0, 0, 0, 1);
          font-size: 16pt;
          padding: 0 8px;
          color: white;
      }

      #workspaces button:hover {
          background: @clock;
          color: @nix;
      }

      #custom-ws {
          background: @main-bg;
          color: @main-fg;
      }

      #workspaces {
          background: @network;
      }

      #custom-left-5,
      #custom-right-5 {
          background: @main-bg;
          color: @network;
      }

      #window {
          color: @main-fg;
      }


      #custom-left-1,
      #custom-right-1 {
          color: @nix;
          background: @main-bg;
      }

      #custom-leftin-1,
      #custom-rightin-1 {
          color: @clock;
      }

      #clock {
          background: @clock;
          color: @main-fg;
          text-shadow: 0px 0px 2px rgba(0, 0, 0, 1);
      }

      #custom-left-2,
      #custom-right-2 {
          color: @clock;
          background: @hardware;
      }


      #cpu,
      #memory {
          color: @main-fg;
          background: @hardware;
      }

      #custom-left-3,
      #custom-right-3 {
          color: @hardware;
          background: @network;
      }

      #network {
          color: @main-fg;
          background: @network;
      }

      #custom-left-4,
      #custom-right-4 {
          color: @network;
          background: @main-bg;
      }

      #pulseaudio {
          color: @main-fg;
          background: @network;
      }
      #custom-left-9 {
          color: @network;
      }

      #backlight {
          color: @main-fg;
          background: @hardware;
      }
      #custom-left-8 {
          color: @hardware;
          background: @network;
      }

      #battery {
          color: @main-fg;
          background: @clock;
      }
      #custom-left-7 {
          background: @hardware;
          color: @clock;
      }

      #temperature {
          color: @main-fg;
          background: @nix-alt;
      }
      #custom-left-6 {
          color: @nix-alt;
      }

      #custom-leftin-2 {
          color: @clock;
      }


      #custom-left-9,
      #custom-left-8,
      #custom-left-7,
      #custom-left-6,
      #custom-left-5,
      #custom-left-4,
      #custom-left-3,
      #custom-left-2,
      #custom-left-1 {
          text-shadow: none;
          padding-left: 3px;
          text-shadow: -3px 0px 2px @shadow;
      }

      #custom-right-5,
      #custom-right-4,
      #custom-right-3,
      #custom-right-2,
      #custom-right-1 {
          text-shadow: none;
          padding-right: 3px;
          text-shadow: 3px 0px 2px @shadow;
      }

      #custom-left-9,
      #custom-left-8,
      #custom-left-7,
      #custom-leftin-2,
      #custom-left-6,
      #custom-left-5,
      #custom-right-5,
      #custom-left-4,
      #custom-right-4,
      #custom-left-3,
      #custom-right-3,
      #custom-left-2,
      #custom-right-2,
      #custom-leftin-1,
      #custom-rightin-1,
      #custom-left-1,
      #custom-right-1 {
          font-size: 16pt;
      }

      @keyframes blink {
          to {
              color: #f53c3c;
          }
      }

      #battery.critical:not(.charging) {
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: steps(12);
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }
    '';
  };
}
