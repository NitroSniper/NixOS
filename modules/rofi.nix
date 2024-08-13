{ config, pkgs, ... }:
{
  programs.rofi = {
    # Original Theme Author:
    # - Aditya Shakya (adi1090x)
    # - Github : @adi1090x
    # Translated to Nix by Nitro Sniper and some modifications

    enable = true;
    package = pkgs.rofi-wayland;
    font = "JetBrains Mono Nerd Font 10";
    extraConfig = {
      modi = "drun,run,window";
      show-icons = false;
      display-drun = " Apps";
      display-run = " Run";
      display-filebrowser = " Files";
      display-window = " Windows";
      drun-display-format = "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
      window-format = "{w} · {c} · {t}";
    };
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        # Color
        "*" = {
          background = mkLiteral "#000000FF";
          background-alt = mkLiteral "#101010FF";
          foreground = mkLiteral "#FFFFFFFF";
          selected = mkLiteral "#62AEEFFF";
          active = mkLiteral "#98C379FF";
          urgent = mkLiteral "#E06B74FF";
          border-colour = mkLiteral "var(selected)";
          handle-colour = mkLiteral "var(selected)";
          background-colour = mkLiteral "var(background)";
          foreground-colour = mkLiteral "var(foreground)";
          alternate-background = mkLiteral "var(background-alt)";
          normal-background = mkLiteral "var(background)";
          normal-foreground = mkLiteral "var(foreground)";
          urgent-background = mkLiteral "var(urgent)";
          urgent-foreground = mkLiteral "var(background)";
          active-background = mkLiteral "var(active)";
          active-foreground = mkLiteral "var(background)";
          selected-normal-background = mkLiteral "var(selected)";
          selected-normal-foreground = mkLiteral "var(background)";
          selected-urgent-background = mkLiteral "var(active)";
          selected-urgent-foreground = mkLiteral "var(background)";
          selected-active-background = mkLiteral "var(urgent)";
          selected-active-foreground = mkLiteral "var(background)";
          alternate-normal-background = mkLiteral "var(background)";
          alternate-normal-foreground = mkLiteral "var(foreground)";
          alternate-urgent-background = mkLiteral "var(urgent)";
          alternate-urgent-foreground = mkLiteral "var(background)";
          alternate-active-background = mkLiteral "var(active)";
          alternate-active-foreground = mkLiteral "var(background)";
        };

        # Main Window
        window = {
          # properties for window widget
          transparency = "real";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = false;
          width = mkLiteral "600px";
          x-offset = mkLiteral "0px";
          y-offset = mkLiteral "0px";

          # properties for all widgets
          enabled = true;
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@border-colour";
          cursor = "default";
          background-color = mkLiteral "@background-colour";
        };

        # Main Box
        mainbox = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "20px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px 0px 0px 0px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "transparent";
          children = map mkLiteral [
            "inputbar"
            "message"
            "listview"
          ];
        };

        # Inputbar
        inputbar = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "@alternate-background";
          text-color = mkLiteral "@foreground-colour";
          children = map mkLiteral [
            "prompt"
            "textbox-prompt-colon"
            "entry"
          ];
        };
        prompt = {
          enabled = true;
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        textbox-prompt-colon = {
          enabled = true;
          expand = false;
          str = "::";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        entry = {
          enabled = true;
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "text";
          placeholder = "Search...";
          placeholder-color = mkLiteral "inherit";
        };
        num-filtered-rows = {
          enabled = true;
          expand = false;
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        textbox-num-sep = {
          enabled = true;
          expand = false;
          str = "/";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        num-rows = {
          enabled = true;
          expand = false;
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        case-indicator = {
          enabled = true;
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };

        # ListView
        listview = {
          enabled = true;
          columns = 1;
          lines = 6;
          cycle = true;
          dynamic = true;
          scrollbar = true;
          layout = mkLiteral "vertical";
          reverse = false;
          fixed-height = true;
          fixed-columns = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground-colour";
          cursor = "default";
        };
        scrollbar = {
          handle-width = mkLiteral "5px";
          handle-color = mkLiteral "@handle-colour";
          border-radius = mkLiteral "0px";
          background-color = mkLiteral "@alternate-background";
        };

        # Elements
        element = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground-colour";
          cursor = mkLiteral "pointer";
        };
        "element normal.normal" = {
          background-color = mkLiteral "var(normal-background)";
          text-color = mkLiteral "var(normal-foreground)";
        };
        "element normal.urgent" = {
          background-color = mkLiteral "var(urgent-background)";
          text-color = mkLiteral "var(urgent-foreground)";
        };
        "element normal.active" = {
          background-color = mkLiteral "var(active-background)";
          text-color = mkLiteral "var(active-foreground)";
        };
        "element selected.normal" = {
          background-color = mkLiteral "var(selected-normal-background)";
          text-color = mkLiteral "var(selected-normal-foreground)";
        };
        "element selected.urgent" = {
          background-color = mkLiteral "var(selected-urgent-background)";
          text-color = mkLiteral "var(selected-urgent-foreground)";
        };
        "element selected.active" = {
          background-color = mkLiteral "var(selected-active-background)";
          text-color = mkLiteral "var(selected-active-foreground)";
        };
        "element alternate.normal" = {
          background-color = mkLiteral "var(alternate-normal-background)";
          text-color = mkLiteral "var(alternate-normal-foreground)";
        };
        "element alternate.urgent" = {
          background-color = mkLiteral "var(alternate-urgent-background)";
          text-color = mkLiteral "var(alternate-urgent-foreground)";
        };
        "element alternate.active" = {
          background-color = mkLiteral "var(alternate-active-background)";
          text-color = mkLiteral "var(alternate-active-foreground)";
        };
        element-icon = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          size = mkLiteral "24px";
          cursor = mkLiteral "inherit";
        };
        element-text = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          highlight = mkLiteral "inherit";
          cursor = mkLiteral "inherit";
          vertical-align = "0.5";
          horizontal-align = "0.0";
        };

        # Mode Switcher
        mode-switcher = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground-colour";
        };
        button = {
          padding = mkLiteral "10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "@alternate-background";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "pointer";
        };
        "button selected" = {
          background-color = mkLiteral "var(selected-normal-background)";
          text-color = mkLiteral "var(selected-normal-foreground)";
        };

        # Message
        message = {
          enabled = true;
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px 0px 0px 0px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground-colour";
        };
        textbox = {
          padding = mkLiteral "10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "@alternate-background";
          text-color = mkLiteral "@foreground-colour";
          vertical-align = "0.5";
          horizontal-align = "0.0";
          highlight = mkLiteral "none";
          placeholder-color = mkLiteral "@foreground-colour";
          blink = true;
          markup = true;
        };
        error-message = {
          padding = mkLiteral "10px";
          border = mkLiteral "2px solid";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "@border-colour";
          background-color = mkLiteral "@background-colour";
          text-color = mkLiteral "@foreground-colour";
        };
      };
  };
}
