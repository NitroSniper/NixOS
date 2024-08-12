{ ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      font = "IosevkaTermSlab Nerd Font Bold";

      # BACKGROUND
      background = {
        monitor = "";
        path = "~/Pictures/background/Quirrel2.png";
        blur_passes = 1;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };

      # GENERAL
      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = false;
      };

      # INPUT FIELD
      input-field = {
        monitor = "";
        size = "250, 60";
        outline_thickness = 2;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(100, 114, 125, 0.4)";
        font_color = "rgb(200, 200, 200)";
        fade_on_empty = false;
        font_family = "$font";
        placeholder_text = ''<i><span foreground="##ffffff99">Enter Pass</span></i>'';
        hide_input = false;
        position = "0, -225";
        halign = "center";
        valign = "center";
      };

      label = [
        # Time
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<span>$(date +"%R")</span>"'';
          color = "rgba(216, 222, 233, 0.70)";
          font_size = 130;
          font_family = "$font";
          position = "0, 240";
          halign = "center";
          valign = "center";
        }
        # Day-Month-Date
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%A, %d %B")"'';
          color = "rgba(216, 222, 233, 0.70)";
          font_size = 30;
          font_family = "$font";
          position = "0, 105";
          halign = "center";
          valign = "center";
        }
        #Quote
        {
          monitor = "";
          text = "No Cost Too Great";
          color = "rgba(255, 255, 255, 0.7)";
          font_size = 18;
          font_family = "$font";
          position = "0, 60";
          halign = "center";
          valign = "bottom";
        }
        # USER
        {
          monitor = "";
          text = "Welcome, Nitro";
          color = "rgba(216, 222, 233, 0.70)";
          font_size = 25;
          font_family = "$font";
          position = "0, -130";
          halign = "center";
          valign = "center";
        }
      ];

      # Profie-Photo
      image = {
        monitor = "";
        path = "~/.config/hypr/ortin.jpg";
        border_size = 2;
        border_color = "rgba(255, 255, 255, .1)";
        size = 120;
        rounding = -1;
        rotate = 0;
        reload_time = -1;
        reload_cmd = "";
        position = "0, -20";
        halign = "center";
        valign = "center";
      };
    };
  };
}
