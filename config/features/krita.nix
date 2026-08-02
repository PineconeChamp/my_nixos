{ self, inputs, ... }: {

  flake.nixosModules.krita = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      krita
    ];
  };
}
