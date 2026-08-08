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
      self.nixosModules.steam
      self.nixosModules.proton
      self.nixosModules.godot
      self.nixosModules.krita
      self.nixosModules.blender
      self.nixosModules.prismlauncher
      self.nixosModules.reaper
      self.nixosModules.wine
      self.nixosModules.bottles
      self.nixosModules.qpwgraph
      self.nixosModules.yabridge
      self.nixosModules.wine-yabridge
      self.nixosModules.audio-plugins
      self.nixosModules.obs-studio
      self.nixosModules.opentabletdriver
    ];

    system.stateVersion = "26.05"; # Did you read the comment?
  };
}
