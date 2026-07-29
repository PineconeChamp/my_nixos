{ self, inputs, ... }: {

  flake.nixosModules.defaultApps = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      spotify
    ];
  };
}
