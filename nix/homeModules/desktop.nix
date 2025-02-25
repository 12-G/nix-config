{ inputs, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    extraConfig = ''
      
      # █▀▄▀█ █▀█ █▄░█ █ ▀█▀ █▀█ █▀█
      # █░▀░█ █▄█ █░▀█ █ ░█░ █▄█ █▀▄
      
      # See https://wiki.hyprland.org/Configuring/Monitors/
      
      # monitor = DP-1, 2560x1080@144, 0x0, 1
      monitor = ,preferred,auto,auto
      
      
      
      # █▀▀ █▄░█ █░█
      # ██▄ █░▀█ ▀▄▀
      
      # Some default env vars.
      
      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_TYPE,wayland
      env = XDG_SESSION_DESKTOP,Hyprland
      env = GDK_BACKEND,wayland
      env = QT_QPA_PLATFORM,wayland
      #env = QT_STYLE_OVERRIDE,kvantum
      env = QT_QPA_PLATFORMTHEME,qt5ct
      env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
      env = QT_AUTO_SCREEN_SCALE_FACTOR,1
      env = MOZ_ENABLE_WAYLAND,1
      
      
      
      # █ █▄░█ █▀█ █░█ ▀█▀
      # █ █░▀█ █▀▀ █▄█ ░█░
      
      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      
      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =
          follow_mouse = 1
      
          touchpad {
              natural_scroll = no
          }
      
          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
          force_no_accel = 1
      }
      
      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      
      device:epic mouse V1 {
          sensitivity = -0.5
      }
      
      # See https://wiki.hyprland.org/Configuring/Variables/ for more
      
      gestures {
          workspace_swipe = true
          workspace_swipe_fingers = 3
      }
      
      
      
      # █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀ █▀
      # █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░ ▄█
      
      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      
      dwindle {
          pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = yes # you probably want this
      }
      
      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      
      master {
          new_is_master = true
      }
      
      
      
      # █▀▄▀█ █ █▀ █▀▀
      # █░▀░█ █ ▄█ █▄▄
      
      # See https://wiki.hyprland.org/Configuring/Variables/ for more
      
      misc {
          vrr = 0
      }
      
    '';
  };
}
