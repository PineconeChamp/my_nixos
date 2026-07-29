{ self, inputs, ...}: {
flake.nixosModules.homeSysConfiguration = { config, pkgs, ... }:

{
  imports = [
    self.nixosModules.homeSysHardware
    self.nixosModules.fonts
    self.nixosModules.core
    self.nixosModules.defaultApps
 ];

  #Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."pine" = {
    isNormalUser = true;
    description = "pine";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
	firefox
  ];

  programs.thunar.enable = true;

  system.stateVersion = "26.05"; # Did you read the comment?

};
}
