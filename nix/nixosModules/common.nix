{ inputs, pkgs, lib, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.impermanence
    inputs.home-manager.nixosModules.home-manager

    ./impermanence.nix
  ];

  programs.fish.enable = true;
  programs.hyprland.enable = true;

  users.users.ethan = {
    isNormalUser = true;

    initialHashedPassword = "$y$j9T$7xCKWwra6m8JcYcJ26hE0.$98S/ijX6zFYeNKEvn9dJAsvhwJ/gYVBHB8CH/i2V6v3";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.ethan = inputs.self.homeModules.home;
    extraSpecialArgs = { inherit inputs; };
  };
}
