{ inputs, pkgs, lib, ... }:

let
  playerctl = "${pkgs.playerctl}/bin/playerctl";
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
in {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      exec-once = [
      ];
      
      monitor = [
        ",preferred,auto,1.5"
      ];

      general = {
        layout = "master";
	gaps_in = 5;
	gaps_out = 10;
	border_size = 4;

	"col.active_border" = "0xFFB4A1DB";
	"col.inactive_border" = "0xFF343A40";
      };

      input = {
        kb_layout = "us";
	follow_mouse = 1;

	repeat_rate = 30;
	repeat_delay = 240;

	float_switch_override_focus = 2;

	numlock_by_default = true;
      };

      misc = {
        disable_hyprland_logo = true;
	focus_on_activate = true;
      };

      decoration = {
        drop_shadow = "yes";
	shadow_range = 8;
	shadow_render_power = 2;

	dim_inactive = false;

        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          new_optimizations = "on";
          noise = 0.01;
          contrast = 0.9;
          brightness = 0.8;
          popups = true;
        };
      };

      animations = {
        enabled = "yes";
	bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
	animation = [
	  "windows, 1, 5, myBezier"
	  "windowsOut, 1, 7, default, popin 80%"
	  "border, 1, 10, default"
	  "fade, 1, 7, default"
	  "workspaces, 1, 6, default"
	];
      };

      bind = let
        binding = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
	mvfocus = binding "SUPER" "movefocus";
	ws = binding "SUPER" "workspace";
	resizeactive = binding "SUPER CTRL" "resizeactive";
	mvw = binding "CTRL SHIFT" "movewindow";
	mvtows = binding "ALT" "movetoworkspace";
	arr = [1 2 3 4 5 6 7];
      in
        [
	  # Hyprland relative
	  "SUPER, Q, killactive"
	  "SUPER, M, exit"
	  "SUPER SHIFT, F, fullscreen"
	  "SUPER, V, togglefloating"

	  # Launch programs
          "SHIFT, Return, exec, kitty"
	  "SUPER, F, exec, firefox"

	  # Move focus with SUPER + {h,j,k,l}
	  (mvfocus "k" "u")
	  (mvfocus "j" "d")
	  (mvfocus "l" "r")
	  (mvfocus "h" "l")

	  # Move windows CTRL + SHIFT + {h,j,k,l}
	  (mvw "k" "u")
	  (mvw "j" "d")
	  (mvw "l" "r")
	  (mvw "h" "l")

	  # Resize windows with SUPERCTRL + {h,j,k,l}
	  (resizeactive "k" "0 -70")
	  (resizeactive "j" "0 70")
	  (resizeactive "l" "70 0")
	  (resizeactive "h" "-70 0")
	]

	  # Switch workspaces with SUPER + [1-7]
	++ (map (i: ws (toString i) (toString i)) arr)
	++ (map (i: mvtows (toString i) (toString i)) arr);
      
      bindm = [
        "SUPER, mouse:273, resizewindow"
	"SUPER, mouse:272, movewindow"
      ];
    };
  };
}
