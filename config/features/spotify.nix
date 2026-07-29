{ self, inputs, ... }: {

  flake.nixosModules.spotify = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      spotify
    ];
  };
}
