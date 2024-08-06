{ config, pkgs, inputs, ... }:

{
  imports = [
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.gruvbox.enable = true;

  };

}
