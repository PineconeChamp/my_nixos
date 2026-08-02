{ self, inputs, ... }: {

  flake.nixosModules.yabridge = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      yabridge
      yabridgectl
    ];
  };
}
