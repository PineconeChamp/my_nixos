{ self, inputs, ... }: {

  flake.nixosModules.wine-yabridge = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      wineWow64Packages.yabridge
    ];
  };
}
