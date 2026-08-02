{ self, inputs, ... }: {

  flake.nixosModules.obs-studio = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      obs-studio
    ];
  };
}
