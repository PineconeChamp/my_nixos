{ self, inputs, ...}: {
  flake.nixosConfigurations.homeSys = inputs.nixpkgs.lib.nixosSystem {

    modules = [
      self.nixosModules.homeSysHardware
      self.nixosModules.desktop
      self.nixosModules.fonts
      self.nixosModules.defaultApps
      self.nixosModules.hyprland
      self.nixosModules.noctalia
      self.nixosModules.firefox
      self.nixosModules.spotify
      self.nixosModules.discord
    ];

    system.stateVersion = "26.05"; # Did you read the comment?
  };
}
