{ pkgs, inputs, ...}:

{
  imports = [ inputs.impermanence.nixosModules.home-manager.impermanence ];

  systemd.user.startServices = "sd-switch";

  home.persistence."/persist/home/ethan" = {
    allowOther = true;

    directories = [
      "Downloads"
      "Pictures"
      "Documents"
      "Videos"
      "flakes"
      ".ssh"
      ".config"
    ];
  };
}
