{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    # systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [
          "custom/OS"
          "custom/DToL-R-Arrow"
          "hyprland/workspaces"
          "custom/LToD-R-Arrow"
          "network"
          "custom/DToBG-R-Arrow"
        ];
        modules-center = [
          "custom/DToBG-L-Arrow"
          "clock"
          "custom/DToBG-R-Arrow"
        ];
        modules-right = [
          "custom/DToBG-L-Arrow"
          "pulseaudio"
          "custom/LToD-L-Arrow"
          "memory"
          "custom/DToL-L-Arrow"
          "temperature"
          "custom/LToD-L-Arrow"
          "battery"
          "custom/DToL-L-Arrow"
          "user"
        ];
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = "󰋙";
            active = "";
          };
        };
        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 16;
          icon-theme = "Numix-Circle";
          tooltip = false;
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-middle = "close";
        };
        user = {
          format = "{user}";
          interval = 60;
        };
        pulseaudio = {
          tooltip = false;
          scroll-step = 5;
          format = "{icon}  {volume}%";
          format-icons = {
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          format-muted = "󰝟 ";
          format-bluetooth = "󰂯 {volume}%";
          on-click = "pavucontrol";
        };
        clock = {
          tooltip = true;
          format = "{:%R %A %d}";
          tooltip-format = "{:%R %a %d/%m/%y}";
        };
        memory = {
          interval = 30;
          format = "󰍛 {used:0.1f}G";
        };
        network = {
          tooltip = true;
          format-wifi = "{icon} {essid}";
          format-disconnect = "{icon}  saldkfj {essid}";
          format-icons = [
            "󰤯 "
            "󰤟 "
            "󰤢 "
            "󰤥 "
            "󰤨 "
          ];
          tooltip-format-wifi = "{essid} ({signalStrength}%) {icon}\n{ipaddr}";
        };
        backlight = {
          tooltip = false;
          scroll-step = 5;
          device = "intel_backlight";
          format = "{icon} {}%";
          format-icons = {
            default = [
              "󰃞"
              "󰃟"
              "󰃠"
            ];
          };
        };
        temperature = {
          thermal-zone = 1;
          tooltip = false;
          interval = 10;
          format = " {temperatureC}°C";
        };
        tray = {
          spacing = 5;
        };
        battery = {
          interval = 5;
          tooltip = false;
          format = "{icon} {capacity}%";
          format-charging = "󱐋 {capacity}%";
          format-icons = {
            default = [
              "󰁻"
              "󰁽"
              "󰁿"
              "󰂁"
              "󰁹"
            ];
          };
          states = {
            full = 100;
            discharging = 90;
            critical = 15;
          };
        };
        "custom/DToL-R-Arrow" = {
          format = "";
          tooltip = false;
        };
        "custom/LToD-R-Arrow" = {
          format = "";
          tooltip = false;
        };
        "custom/DToBG-R-Arrow" = {
          format = "";
          tooltip = false;
        };
        "custom/DToL-L-Arrow" = {
          format = "";
          tooltip = false;
        };
        "custom/LToD-L-Arrow" = {
          format = "";
          tooltip = false;
        }
        "custom/DToBG-L-Arrow" = {
          format = "";
          tooltip = false;
        };
        "custom/OS" = {
          format = " ";
          tooltip = false;
        };
      };
    };
    style = ''

      * {
          background: none;
          /* background-color: black; */
          color: white;
          font-family: "Roboto Mono Medium";

          font-size: 1rem;
          padding-top: 0.2rem;
          min-height: 0;
      }
      #workspaces, #battery, #memory {
          background: #111111;
      }

      #clock, #network, #custom-OS, #user, #temperature, #pulseaudio {
          background: black;
      }
      #custom-OS {
          font-size: 1.4rem;
          color: #5277c3;
      }


      tooltip {
        background: rgba(43, 48, 59, 0.5);
        border: 1px solid rgba(100, 114, 125, 0.5);
      }

      #custom-DToBG-R-Arrow,
      #custom-DToBG-L-Arrow {
      	color: black;
          font-size: 1.5rem;
      }
      #workspaces button.focused {
          background: #64727D;
          border: 10px solid green;
      }

      #custom-LToD-R-Arrow,
      #custom-LToD-L-Arrow {
      	color: #111111;
          background: black;
          font-size: 1.5rem;
      }

      #custom-DToL-R-Arrow,
      #custom-DToL-L-Arrow {
      	color: black;
          background: #111111;
          font-size: 1.5rem;
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
