{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.self.homeModules.desktop

    ./home_impermanence.nix
  ];

  home = {
    username = "ethan";
    homeDirectory = "/home/ethan";

    stateVersion = "24.11";
  };

  home.packages = with pkgs; [
    # archive
    zip
    unzip
    p7zip

    # utils
    ripgrep
    fzf
  ];

  programs.firefox = {
    enable = true;
  };

  programs.fd = {
    enable = true;
    hidden = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  programs.git = {
    enable = true;
    userName = "Ethan";
    userEmail = "1240121425@qq.com";
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
  };

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.gruvbox.enable = true;
    plugins.lightline.enable = true;
  };

  programs.starship = {
    enable = true;
  };

  programs.home-manager.enable = true;
}
