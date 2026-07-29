{ self, inputs, ... }: {

  flake.nixosModules.noctalia = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      noctalia
    ];
  };
}
