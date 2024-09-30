{ pkgs, ... }:
{
  home.packages = [
    (import ./hyprland-gamemode.nix { inherit pkgs; })
    (import ./hyprland-maxtile.nix { inherit pkgs; })
  ];
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      ###################
      ### MY PROGRAMS ###
      ###################

      # See https://wiki.hyprland.org/Configuring/Keywords/
      # Set application defaults
      "$terminal" = "kitty";
      "$fileManager" = "yazi";
      "$menu" = "rofi";
      "$browser" = "vivaldi";

      exec-once = [
        "hyprlock --immediate-render"
        "swaybg -i ~/Pictures/background/BlueLake.png"
        "waybar"
      ];

      ################
      ### MONITORS ###
      ################

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor = ", preferred, auto, 1";

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      # See https://wiki.hyprland.org/Configuring/Environment-variables/
      env = [
        "XCURSOR_SIZE, 24"
        "HYPRCURSOR_SIZE, 24"
        "HYPRCURSOR_THEME, catppuccin-mocha-dark-cursors"
      ];

      #####################
      ### LOOK AND FEEL ###
      #####################

      # https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        gaps_in = 5;
        gaps_out = 20;

        border_size = 2;

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = "rgba(5277C3ee) rgba(7EB8E1ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        layout = "dwindle";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        rounding = 10;

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#animations
      animations = {
        enabled = true;

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

      misc = {
        force_default_wallpaper = -1;
        # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = false;
        # If true disables the random hyprland logo / anime girl background. :(
      };

      #############
      ### INPUT ###
      #############

      # https://wiki.hyprland.org/Configuring/Variables/#input
      input = {
        kb_layout = "gb";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          natural_scroll = false;
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = {
        workspace_swipe = true;
      };

      ####################
      ### KEYBINDINGSS ###
      ####################

      # See https://wiki.hyprland.org/Configuring/Keywords/

      "$mod" = "SUPER"; # Sets "Windows" key as the modifier key

      bindel = [
        # Audio
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 1%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 1%-"

        # Brightness
        ", XF86MonBrightnessUp, exec, brillo -q -A 1"
        ", XF86MonBrightnessDown, exec, brillo -q -U 1"

        # Resize active with mod + shift + hjkl
        "$mod SHIFT, H, resizeactive, -10 0"
        "$mod SHIFT, L, resizeactive, 10 0"
        "$mod SHIFT, K, resizeactive, 0 -10"
        "$mod SHIFT, J, resizeactive, 0 10"
      ];
      bindl = [
        # Mute Audio toggle
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        # Player for music and videos
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", switch:Lid Switch, exec, hyprlock"
      ];

      bind = [
        # Performance
        "$mod, F1, exec, hyprland-gamemode"
        "$mod, F1, exec, ${pkgs.hyprshot}/bin/hyprshot -m region -z --clipboard-only"
        "$mod, F2, exec, ${pkgs.hyprpicker}/bin/hyprpicker --autocopy"
        "$mod, F4, exec, hyprland-maxtile"

        # Utility
        "$mod SHIFT, Q, exec, hyprlock"
        "$mod SHIFT, P, pin, active"

        # Display
        "$mod, F, fullscreen, 0"
        "$mod SHIFT, F, togglefloating,"

        "$mod SHIFT, return, exec, $terminal"
        "$mod, Q, killactive,"
        "$mod SHIFT ALT, Q, exit,"
        "$mod, E, exec, $fileManager"

        # "$mod, P, pseudo, # dwindle"
        # bind = $mod, J, togglesplit, # dwindle

        # Move focus with mod + hjkl
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace with mod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mod + scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

      ];

      bindr = [ "$mod, $mod_L, exec, pkill $menu || $menu -show drun" ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      windowrulev2 = "opacity 0.9 0.7, class:(kitty)";
    };
  };
}
